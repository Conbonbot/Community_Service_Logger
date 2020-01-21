desc "This task is called by the Heroku scheduler add-on"
task :check_students => :environment do
    puts "Updating Feed..."
    @users = User.all.order(grade: :asc)
    @users.each do |user|
        puts "Class of: " + user.grade.to_s + ", Student ID: " + user.student_id.to_s
    end
end

task :change_students => :environment do
    
end

task :check_time => :environment do
    puts Time.now
    if Time.now.strftime("%m") == 7
        if Time.now.strftime("%d") == 22
            puts "Time to Change students"
            # increase level of students and delete seniors
        else
            puts "July, but not the 22nd"
        end
        
    else
        puts "Not July"
    end
end