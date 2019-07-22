class UsersController < ApplicationController
  before_action :validate_url_hack, only: []
  before_action :logged_in_user, only: []
  before_action :correct_user,   only: []
 

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
      @user.cutoff = "Jul 22 2019"
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
    params.require(:user).permit(:id, :first_name, :last_name, :email, :student_id, :grade, :password, :password_confirmation, :cutoff)
  end
  
  # Before filters
  
  # Confirms a logged in user
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      #redirect_to 'https://www.youtube.com/watch?v=8ZcmTl_1ER8', :overwrite_params => { :parm => 'foo' }
      redirect_to root_url
    end
  end
  
  # Confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user?
  end
  
  def validate_url_hack
    unless params[:id].to_i == current_user.id
      flash[:danger] = "Please log in"
      redirect_to root_url
    end
  end
  

  
end
