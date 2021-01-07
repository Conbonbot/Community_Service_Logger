class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @user = User.find(params[:id])
    if @user.hours.any?
      @hours = @user.hours.all
    end
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save # <-- assigns the activation_token and digest
      @user.update_attribute(:level, determine_level(@user))
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
      #Use lower code until Mailer is fixed
      #@user.activate
      #log_in(@user)
      #redirect_to @user
      #flash[:success] = "Account Created and Activated"
    else
      render 'new'
    end
  end
  
  def all_supervisors
    @supervisors = Supervisor.where(activated: true)
  end

  private
  
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :student_id, :grade, :password, :password_confirmation)
  end
  
  private
  
  def correct_user
    @user = User.find(params[:id]) 
    if logged_in?
      if !current_user.admin?
        if !current_user?(@user)
          redirect_to(root_url)
          #redirect_to 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', :overwrite_params => { :parm => 'foo' }
        end
      end
    elsif supervisor_logged_in?
      if !current_supervisor.admin?
        redirect_to(root_url)
      end
    end
  end
  
  def determine_level(user)
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
      
  
end
