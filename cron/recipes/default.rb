node[:cron].each do |task|

  cron %Q["#{task[:description]}"] do
    minute %Q[#{task[:minute]}"] if task[:minute]
    hour %Q[#{task[:hour]}"] if task[:hour]
    weekday %Q["#{task[:weekday]}"] if task[:weekday]

    command %Q["#{task[:command]}"]

    action :create
  end

end
