execute "start_delayed_job_workers" do
  command %Q{
    ruby ../srv/www/switchboard_unicorn/current/script/job_runner
  }
end
