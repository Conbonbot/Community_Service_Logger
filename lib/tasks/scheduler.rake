desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
    puts "Updating Feed..."
    NewsFeed.update
    puts "Done"
end

task :send_reminders => :environment do
    User.send_reminders
end