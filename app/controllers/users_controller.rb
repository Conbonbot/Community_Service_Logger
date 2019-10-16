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
    if @user.save
      #@user.send_activation_email
      #flash[:info] = "Please check your email to activate your account"
      #redirect_to root_url
      # Use lower code until Mailer is fixed
      @user.activate
      log_in(@user)
      redirect_to @user
      flash[:success] = "Account Created and Activated"
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
    else
      redirect_to(root_url)
      #redirect_to 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', :overwrite_params => { :parm => 'foo' }
    end
  end
      
  
end
