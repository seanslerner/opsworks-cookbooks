cron "send_email_alerts" do
  minute  "10"
  hour    "15"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production email_subscription_scheduler"
end
