desc "This task is called by the Heroku scheduler add-on"
task :check_students => :environment do
    puts "Updating Feed..."
    @users = User.all.order(grade: :asc)
    @users.each do |user|
        puts "Class of: " + user.grade.to_s + ", Student ID: " + user.student_id.to_s
    end
end


task :check_time => :environment do
    puts Time.now
    if Time.now.strftime("%m") == 7
        if Time.now.strftime("%d") == 22
            puts "Time to Change students"
            # increase level of students and delete seniors
            @users = User.all
            for i in 0..@users.count()-1 
                # Freshmen to Sophomore
                if @users[i].level = "Fr"
                    @users[i].update_attribute(:level, "So")
                # Sophomore to Junior
                elsif @users[i].level = "So"
                    @users[i].update_attribute(:level, "Ju")
                # Junior to Senior
                elsif @users[i].level = "Ju"
                    @users[i].update_attribute(:level, "Se")
                # Senior to DEAD
                elsif @users[i].level = "Se"
                    @users[i].delete
                end
                
            end
            
        else
            puts "July, but not the 22nd"
        end
        
    else
        puts "Not July"
    end
end