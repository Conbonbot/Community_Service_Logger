class SupervisorPasswordResetsController < ApplicationController
  before_action :get_supervisor, only: [:edit, :update]
  before_action :valid_supervisor, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end
  
  def create
    @supervisor = Supervisor.find_by(email: params[:supervisor_password_reset][:email].downcase)
    if @supervisor
      @supervisor.create_reset_digest
      @supervisor.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash[:danger] = "Emaill address not found"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if params[:supervisor][:password].empty?
      @supervisor.errors.add(:password, "Can't be empty")
      render 'edit'
    elsif @supervisor.update(supervisor_params)
      supervisor_log_in @supervisor
      flash[:success] = "Password has been reset"
      redirect_to @supervisor
    else
      render 'edit'
    end
  end
  
  private
  
  def supervisor_params
    params.require(:supervisor).permit(:password, :password_confirmation)
  end
  
  def get_supervisor
    @supervisor = Supervisor.find_by(email: params[:email])
  end
  
  def valid_supervisor
    unless (@supervisor && @supervisor.activated? && @supervisor.authenticated?(:reset, params[:id]))
       redirect_to root_url
    end
  end
  
  def check_expiration
    if @supervisor.password_reset_expired?
      flash[:danger] = "Password reset has expired"
      redirect_to new_supervisor_password_reset_url
    end
  end
end
