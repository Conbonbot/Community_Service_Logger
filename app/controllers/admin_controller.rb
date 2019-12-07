require 'roo'
class AdminController < ApplicationController
  before_action :admin_user
  
  def home
    @users = User.all
    @supervisors = Supervisor.all
    @hours = Hour.where(approved: true)
    @hours_week = @hours.where(updated_at: 1.week.ago.in_time_zone("Pacific Time (US & Canada)")..Time.zone.now)
    @hours_month = @hours.where(updated_at: 1.month.ago.in_time_zone("Pacific Time (US & Canada)")..Time.zone.now)
    @hw = 0
    @hm = 0
    for i in 0..@hours_week.size()-1
      @hw += @hours_week[i].content
    end
    for i in 0..@hours_month.size()-1
      @hm += @hours_month[i].content
    end
  end
  
  def transfer
    xlsx = Roo::Spreadsheet.open('./Copy of Community Service 2015-2016.xlsx')
    seniors= xlsx.sheet('SENIORS 2020')
    @students = []
    i = 0
    seniors.each do |senior|
      id = senior[0]
      last_name = senior[1]
      first_name = senior[2]
      hours = senior[6]
      if hours.nil?
        hours = 0
      end
      student = [id,last_name,first_name,hours]
      @students[i] = student
      i = i + 1
    end
    for i in 0..@students.size()-1
      for j in 0..@students[i].size()-1
        if @students[i][j].nil?
          debugger
        end
      end
      email = @students[i][2].downcase.to_s[0] + @students[i][1].downcase.to_s[0..2] + @students[i][0].to_s[2..5] + "@stu.gusd.net"
      password = "gusd" + @students[i][0].to_s
      user = User.new(first_name: @students[i][2].to_s,
                  last_name: @students[i][1].to_s,
                  email: email,
                  student_id: @students[i][0],
                  grade: "2020",
                  created_at: Time.zone.now,
                  password: password,
                  password_confirmation: password,
                  activated: true,
                  activated_at: Time.zone.now
                  )
      if user.valid?
        user.save
        if !(@students[i][3] == 0)
          user.hours.create(content: @students[i][3], user_id: user.id, created_at: Time.zone.now, approved: true, email: "old_system@CVHS.com")
        end
      else
        debugger
      end
    end
  end
  
  def freshmen
  end
  
  def sophomores
  end
  
  def juniors
  end
  
  def seniors
  end
  
  def charts
    @values = Array.new(12)
    yeah = 12
    for i in 0..@values.count-1
      @stuff = Hour.where(approved: true, updated_at: (yeah).month.ago..(yeah-1).month.ago)
      @values[i] = mon_total(@stuff)
      yeah -= 1
    end
    @times = Array.new(12)
    counter = 11
    for i in 0..@times.count-1
      @times[i] = counter.months.ago.strftime("%B")
      counter -= 1
    end
    gon.times = @times
    gon.values = @values
  end
  
  def tables
  end
  
  def students
    @students = User.all
    @totals = Array.new(1)
    for i in 0..@students.size()-1
      @totals[i] = total(@students[i])
    end
    @stu_hours = Array.new(@students.size()) {Array.new(2, 0)}
    for i in 0..@students.size()-1
      @stu_hours[i][0] = @students[i]
      @stu_hours[i][1] = @totals[i]
    end
  end
  
  def supcharts
  end
  
  def suptables
    @supervisors = Supervisor.all
    @totals = Array.new(1)
    for i in 0..@supervisors.size()-1
      @totals[i] = sup_total(@supervisors[i])
    end
    @sup_hours = Array.new(@supervisors.size()) {Array.new(2, 0)}
    for i in 0..@supervisors.size()-1
      @sup_hours[i][0] = @supervisors[i]
      @sup_hours[i][1] = @totals[i]
    end 
  end
  
  def activate_stu
    @users = User.where(activated: false)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :student_id, :grade, :password, :password_confirmation)
  end
  
  # Return the total approved hours of a User 
  def total(user)
    tot = 0
    hours = Hour.where(user_id: user.id, approved: true)
    for x in 0..hours.count-1
      tot += hours[x].content
    end
    return tot
  end
  
  # Returns the amount of hours from a given set
  def mon_total(array)
    tot = 0
    for i in 0..array.count-1
      tot += array[i].content
    end
    return tot
  end
  
  # Returns the total hours a supervisor has approved
  def sup_total(supervisor)
      tot = 0
      hours = Hour.where(email: supervisor.email)
      for i in 0..hours.count-1
          tot +=hours[i].content
      end
      return tot
  end
  
  def admin_user
    if logged_in?
      redirect_to(root_url) unless current_user.admin?
      if !current_user.admin?
        flash[:warning] = "Must be admin"
        redirect_to(root_url) 
      end
    elsif supervisor_logged_in?
    redirect_to(root_url) unless current_supervisor.admin?
    if !current_supervisor.admin?
      flash[:warning] = "Must be admin"
      redirect_to(root_url)
    end
    else
      redirect_to(supervisor_login_path)
      flash[:warning] = "Please Log in"
    end
  end
end
