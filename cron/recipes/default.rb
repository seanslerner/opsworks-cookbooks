cron "send_email_alerts" do
  minute  "10"
  hour    "15"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production alert_scheduler"
end

cron "calculate_scores" do
  minute  "0"
  hour    "4"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production calculate_scores"
end

cron "promote_posts" do
  minute  "0"
  hour    "15"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production promotions"
end
