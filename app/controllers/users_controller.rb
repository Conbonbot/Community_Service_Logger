class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    if @user.hours.any?
      @hours = @user.hours.paginate(page: params[:page])
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

  def hours
  end

  def volunteer
  end
  
  private
  
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :student_id, :grade, :password, :password_confirmation, :signature)
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
    redirect_to(root_url) unless @user == current_user?(@user)
  end
  
end
