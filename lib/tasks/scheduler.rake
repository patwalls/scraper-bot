desc "This task is called by the Heroku scheduler add-on"
task :check_reddit => :environment do
  puts "Checking reddit..."
  Keyword.check_reddit
  puts "done."
end

task :send_reminders => :environment do
  # User.send_reminders
end
