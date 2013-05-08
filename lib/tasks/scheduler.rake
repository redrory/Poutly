desc "This task is called by the Heroku scheduler add-on"
task :daily_email => :environment do
  puts "Running Client daily email"
  Client.daily_email
  puts "done."
end

task :weekly_email => :environment do
  if Tme.now.monday?
  puts "Running Client weekly email"
  Client.weekly_email
  puts "done."
end
end

task :send_reminders => :environment do
  User.send_reminders
end