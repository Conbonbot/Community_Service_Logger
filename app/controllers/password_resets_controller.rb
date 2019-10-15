class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update] 
  
  def new
  end
  
  def create
    @user = User.find_by(student_id: params[:password_reset][:student_id])
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      msg = "Email sent to "
      msg += @user.email
      msg += " with password reset instructions"
      flash[:info] = msg
      redirect_to root_url
    else
      flash.now[:danger] = "Student ID not found"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if params[:user][:password].empty?  
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end

  
  private 
  
  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :email, :student_id, :grade, :password, :password_confirmation, :cutoff)
  end
  
  def get_user
    @user = User.find_by(email: params[:student_id])
  end

  # Confirms a valid user.
  def valid_user
    unless (@user && @user.activated? &&
            @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end
  
  # Checks expiration of reset token.
  def check_expiration
     if @user.password_reset_expired?
       flash[:danger] = "Password reset has expired."
       redirect_to new_password_reset_url
     end
  end
  
end
