class UsersController < ApplicationController
  before_action :logged_in_user
 

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
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
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
  
  # Before filters
  private
  
  # Confirms a logged in user
  def logged_in_user
    print(User.find_by(params[:id]))
      #redirect_to 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', :overwrite_params => { :parm => 'foo' }
  end
  
  
end
