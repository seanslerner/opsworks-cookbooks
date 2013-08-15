gem_package 'remote_syslog' do
  version node[:remote_syslog][:version]
  retries 2
end

