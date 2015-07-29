# cron "send_email_alerts" do
#   minute  "10"
#   hour    "15"
#   day     "*"
#   command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production alert_scheduler"
# end

cron "send post survey notifications" do
  minute  "0"
  hour    "14"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production post_surveys:notifications"
end

cron "prepare weekly digests" do
  minute  "0"
  hour    "7"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production digests:collect_posts"
end

cron "send_weekly_digests" do
  minute  "10"
  hour    "15"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production digests:deliver"
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

cron "process_email_queue" do
  minute "30"
  hour   "8"
  day    "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production email:queue:process"
end

cron "expire_gifted gold" do
  minute  "10"
  hour    "0"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production gold:expire_gifted"
end

cron "check_card_expiration" do
  minute  "30"
  hour    "10"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production gold:check_card_expiration"
end

# cron "score_communities" do
#   minute  "0"
#   hour    "10"
#   day     "*"
#   command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production score_communities"
# end

cron "summarize_all_communities" do
  minute  "0"
  hour    "15"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production argus:summarize_all_communities"
end

cron "founder_digest_weekly" do
  minute  "0"
  hour    "8"
  weekday "0"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production insights:founder_digest_weekly"
end

cron "track accepted invites" do
  minute  "0"
  hour    "5"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production invites:track_accepted"
end

cron "report search stats" do
  minute  "30"
  hour    "*"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production slack_stats:search_and_filter"
end

