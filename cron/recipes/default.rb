cron "send_email_subscriptions" do
  hour "23"
  weekday "0"
  command 'cd ../srv/www/switchboard_unicorn/current/ && bundle exec rake email_subscription_scheduler'
end

cron "geocode_locations" do
  hour "22"
  weekday "0"
  command 'cd ../srv/www/switchboard_unicorn/current/ && bundle exec rake geocode_update'
end