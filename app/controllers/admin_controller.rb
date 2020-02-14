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
  
  def levels
    @users = User.all
    for i in 0..@users.count()-1
      @users[i].update_attribute(:level, stu_level(@users[i]))
    end
  end
  
  def transfer
    xlsx = Roo::Spreadsheet.open('./Copy of Community Service 2015-2016.xlsx')
    seniors= xlsx.sheet('SENIORS 2020')
    @students = []
    i = 0
    seniors.each do |senior|
      id = senior[0]
      next if id.nil?
      last_name = senior[1]
      first_name = senior[2]
      hours = senior[6]
      next if hours.nil?
      student = [id,last_name,first_name,hours]
      @students[i] = student
      i = i + 1
    end
    juniors= xlsx.sheet('Juniors 2021')
    i = @students.count
    juniors.each do |junior|
      id = junior[0]
      next if id.nil?
      last_name = junior[1]
      first_name = junior[2]
      hours = junior[5]
      next if hours.nil?
      student = [id, last_name, first_name, hours]
      @students[i] = student
      i = i + 1
    end
    xls  = Roo::Spreadsheet.open('./CS 2022 & 2023.xlsx')
    sophomores = xls.sheet('Sophomores 2022')
    i = @students.count
    sophomores.each do |sophomore|
      next if sophomore[0].index(',').nil? or sophomore[0].index('(').nil? or sophomore[0].index(')').nil?
      last_name = sophomore[0][0..sophomore[0].index(',')-1]
      first_name = sophomore[0][sophomore[0].index(',')+2..sophomore[0].index('(')-1]
      id = sophomore[0][sophomore[0].index('(')+1..sophomore[0].index(")")-1]
      hours = sophomore[5]
      next if hours.nil?
      student = [id, last_name, first_name, hours]
      @students[i] = student
      i = i + 1
    end
    freshmen = xls.sheet('Freshmen 2023')
    i = @students.count
    freshmen.each do |freshman|
      next if freshman[5].nil?
      student = [freshman[0], freshman[1], freshman[2], freshman[5]]
      @students[i] = student
      i = i + 1
    end
    @final_students = []
    index = 0
    for i in 0..@students.count()-1
      if !(User.find_by(student_id: @students[i][0])).nil?
        if User.find_by(student_id: @students[i][0]).hours.find_by(email: "old_system@CVHS.com").nil?
          @final_students[index] = @students[i]
          index = index + 1
        end
      end
    end
    for i in 0..@final_students.count()-1
      @final_students[i][4] = @final_students[i][0].to_s + " " + @final_students[i][3].to_s
    end
    @pass = []
    for i in 0..@final_students.count()-1
      @pass[i] = @final_students[i][0].to_s + " " + @final_students[i][3].to_s
    end
    params[:final] = @pass
  end
  
  def full_transfer
    @final = params[:id]
    @split = (0..@final.length).find_all { |i| @final[i,1] == "/"}
    @id_h = []
    start = -1
    for i in 0..@split.count()
      if @split[i].nil?
        @split[i] = @final.length
      end
      @id_h[i] = @final[start+1..@split[i]-1]
      start = @split[i]
    end
    for i in 0..@id_h.count()-1
      User.find_by(student_id: @id_h[i][0..@id_h[i].index(" ")-1]).hours.create(content: @id_h[i][@id_h[i].index(" ")+1..@id_h[i].length-1], created_at: Time.zone.now, approved: true, email: "old_system@CVHS.com", organization: "Old System")
    end
    redirect_to transfer_path
    flash[:success] = "Hours Transfered"
  end
  
  def show
  end
  
  def freshmen
    @students = User.where(level: "Fr")
    @totals = Array.new(1)
    for i in 0..@students.size()-1
      @totals[i] = total(@students[i])
    end
    @stu_hours = Array.new(@students.size()) {Array.new(2, 0)}
    for i in 0..@students.size()-1
      @stu_hours[i][0] = @students[i]
      @stu_hours[i][1] = @totals[i]
    end
    @total = 0.0
    for i in 0..@stu_hours.count()-1
      @total += @stu_hours[i][1]
    end
  end
  
  def sophomores
    @students = User.where(level: "So")
    @totals = Array.new(1)
    for i in 0..@students.size()-1
      @totals[i] = total(@students[i])
    end
    @stu_hours = Array.new(@students.size()) {Array.new(2, 0)}
    for i in 0..@students.size()-1
      @stu_hours[i][0] = @students[i]
      @stu_hours[i][1] = @totals[i]
    end
    @total = 0.0
    for i in 0..@stu_hours.count()-1
      @total += @stu_hours[i][1]
    end
  end
  
  def juniors
    @students = User.where(level: "Ju")
    @totals = Array.new(1)
    for i in 0..@students.size()-1
      @totals[i] = total(@students[i])
    end
    @stu_hours = Array.new(@students.size()) {Array.new(2, 0)}
    for i in 0..@students.size()-1
      @stu_hours[i][0] = @students[i]
      @stu_hours[i][1] = @totals[i]
    end
    @total = 0.0
    for i in 0..@stu_hours.count()-1
      @total += @stu_hours[i][1]
    end
  end
  
  def seniors
    @students = User.where(level: "Se")
    @totals = Array.new(1)
    for i in 0..@students.size()-1
      @totals[i] = total(@students[i])
    end
    @stu_hours = Array.new(@students.size()) {Array.new(2, 0)}
    for i in 0..@students.size()-1
      @stu_hours[i][0] = @students[i]
      @stu_hours[i][1] = @totals[i]
    end
    @total = 0.0
    for i in 0..@stu_hours.count()-1
      @total += @stu_hours[i][1]
    end
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
  
  # Returns the Level (Fr, So, Ju, Se) of a student
  def stu_level(user)
    # Use https://docs.google.com/spreadsheets/d/1VaK7odVTlnk6R28_4tIZQXeWpnGQ_6kE2jw-iWw6rcI/edit#gid=0 as a resource
    @user = user
    time = Time.zone.now
    cutoff = DateTime.new(0, 7, 22, 0, 0, 0)
    lev = ""
    if(time.strftime("%m") < cutoff.strftime("%m")) # Before July
      if(time.strftime("%d") < cutoff.strftime("%d")) # Before the 22nd
        if (@user.grade.to_i - time.strftime("%Y").to_i == 0) # Senior
          lev = "Se"
        elsif(@user.grade.to_i - time.strftime("%Y").to_i == 1) # Junior
         lev = "Ju"
        elsif(@user.grade.to_i - time.strftime("%Y").to_i == 2) # Sophomore
         lev = "So"
        elsif(@user.grade.to_i - time.strftime("%Y").to_i == 3) # Freshman
         lev = "Fr"
        else
          lev = "N/A"
        end
      end
    elsif(time.strftime("%m") >= cutoff.strftime("%m")) # During or after July
      if(time.strftime("%d")) >= cutoff.strftime("%d") # During or after the 22nd
        if (@user.grade.to_i - time.strftime("%Y").to_i == 1) # Senior
          lev = "Se"
        elsif(@user.grade.to_i - time.strftime("%Y").to_i == 2) # Junior
          lev = "Ju"
        elsif(@user.grade.to_i - time.strftime("%Y").to_i == 3) # Sophomore
          lev = "So"
        elsif(@user.grade.to_i - time.strftime("%Y").to_i == 4) # Freshman
            lev = "Fr"
        else
          lev = "N/A"
        end
      end
    else
      lev = "N/A"
    end
    return lev
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
