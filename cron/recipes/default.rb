cron "send_email_subscriptions" do
  hour "15"
  day "*"
  command "cd /srv/www/switchboard_unicorn/current/ && bundle exec rake email_subscription_scheduler"
end

cron "geocode_locations" do
  hour "8"
  weekday "0"
  command "cd /srv/www/switchboard_unicorn/current/ && bundle exec rake geocode_update"
end
