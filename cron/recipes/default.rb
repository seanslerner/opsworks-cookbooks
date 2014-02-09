cron "send_email_alerts" do
  minute  "10"
  hour    "15"
  day     "*"
  command "cd /srv/www/switchboard/current && bundle exec rake email_subscription_scheduler"
end
