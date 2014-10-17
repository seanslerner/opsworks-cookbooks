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

cron "parse_logs" do
  minute  "20"
  hour    "*"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production parse_event_log"
end

cron "expire_gifted gold" do
  minute  "10"
  hour    "0"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production expire_gifted"
end

cron "check_card_expiration" do
  minute  "10"
  hour    "30"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production check_card_expiration"
end
