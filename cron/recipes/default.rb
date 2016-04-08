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

# cron "process_email_queue" do
#   minute "30"
#   hour   "8"
#   day    "*"
#   command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production email:queue:process"
# end

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

cron "summarize all communities' user activity (OrcKillah)" do
  minute  "0"
  hour    "16"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production orchestrate_killah"
end

cron "happiness_report" do
  minute  "0"
  hour    "15"
  weekday "5"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production happiness:report"
end

cron "track accepted invites" do
  minute  "0"
  hour    "5"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production invites:track_accepted"
end

cron "refresh user location data from intercom" do
  minute  "0"
  hour    "15"
  weekday "6"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production users:locations:refresh"
end

cron "update community adoption and engagement metadata for higher ed communities" do
  minute  "0"
  hour    "1"
  weekday "0"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production community:meta_data:update"
end

cron "update post impressions metadata for higher ed communities" do
  minute  "0"
  hour    "2"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production community:meta_data:update_impressions_data"
end

cron "update community data in intercom" do
  minute  "30"
  hour    "13"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production intercom:update_communities"
end

cron "motion of that notion" do
  minute  "9"
  hour    "15"
  day     "*"
  command "cd /srv/www/switchboard/current && /usr/local/bin/rake RAILS_ENV=production notion"
end
