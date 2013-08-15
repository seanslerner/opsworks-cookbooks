execute "start_delayed_job_workers" do
  command %Q{
    cd ../srv/www/switchboard_unicorn/current &&
    RAILS_ENV=production script/delayed_job start
  }
end
