class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:success] = "Please check your email to activate your account"
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
    params.require(:user).permit(:first_name, :last_name, :email, :student_id, :grade, :password, :password_confirmation, :signature)
  end
end
