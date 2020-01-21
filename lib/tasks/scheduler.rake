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

task :hehe => :environment do
    for i in 0..1000
        puts "hello"
    end
end