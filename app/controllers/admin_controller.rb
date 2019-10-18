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
  
  def freshmen
  end
  
  def sophomores
  end
  
  def juniors
  end
  
  def seniors
  end
  
  def charts
    @s = Array.new(4,3)
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
  
  private
  
  # Return the total approved hours of a User 
  def total(user)
    tot = 0
    hours = Hour.where(user_id: user.id, approved: true)
    for x in 0..hours.count-1
      tot += hours[x].content
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
