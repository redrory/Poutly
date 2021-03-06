# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
  every 1.days, :at => "10:00pm" do
   runner "Client.cron_test", :environment => "development"
 end

 every 1.days, :at => "11:00pm" do
   runner "Client.daily_email", :environment => "development"
 end

 every 7.days, :at => "11:00pm" do
   runner "Client.weekly_email", :environment => "development"
 end

# Learn more: http://github.com/javan/whenever
