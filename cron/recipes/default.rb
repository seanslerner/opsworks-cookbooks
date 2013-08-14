node[:cron].each do |task|

  cron task[:description] do
    minute "\"#{task[:minute]}\"" if task[:minute]
    hour "\"#{task[:hour]}\"" if task[:hour]
    weekday "\"#{task[:weekday]}\"" if task[:weekday]

    command "\"#{task[:command]}\""
  end

end
