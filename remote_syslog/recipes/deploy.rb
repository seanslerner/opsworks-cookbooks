node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping remote_syslog::deploy as application #{application} is not a Rails application")
    next
  else
    Chef::Log.debug("Running remote_syslog::deploy for Rails application #{application}")
  end

  directory "/var/run/remote_syslog" do
    action :create
    owner deploy[:user]
    group deploy[:group]
    mode "0755"
  end

  directory "/var/run/remote_syslog/#{application}" do
    action :create
    owner deploy[:user]
    group deploy[:group]
    mode "0755"
  end

  logs_list = []
  node[:scalarium][:instance][:roles].each do |role|
    logs_list = logs_list + node[:remote_syslog][:logs][role] if node[:remote_syslog][:logs][role]
  end

  template "#{deploy[:deploy_to]}/current/config/log_files.yml" do
    source "log_files.yml.erb"
    owner deploy[:user]
    mode "0644"
    variables :application => application, :deploy => deploy, :log_files => logs_list
  end

  execute "start remote_syslog" do
    command "/usr/local/bin/remote_syslog -c #{deploy[:deploy_to]}/current/config/log_files.yml -P /var/run/remote_syslog/#{application}"
    user "root"
  end

  template "/etc/monit/conf.d/remote_syslog_#{application}.monitrc" do
    source "remote_syslog.monitrc.erb"
    owner "root"
    mode "0644"
    variables :application => application, :deploy => deploy
  end

  execute "monit reload" do
  end

end