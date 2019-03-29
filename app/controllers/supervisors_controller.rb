class SupervisorsController < ApplicationController
  
  def new
    @supervisor = Supervisor.new
  end
  
  def create
<<<<<<< HEAD
<<<<<<< HEAD
    @supervisor = Supervior.new(supervisor_params)
    if @supervisor.save
      flash[:success] = "Welcome"
=======
   @supervisor = Supervior.create(supervisor_params)
    if @supervisor.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
>>>>>>> 3c81167c150e32626fcf7cdb07d175b3064e3ee5
=======
   Supervisor.new = Supervior.create(supervisor_params)
    if @supervisor.save
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
>>>>>>> e040f7c57505da0371eb9640498f0c6ff54f8418
    else
      render 'new'
    end
  end
  
  def home
  end

  def hours
  end
  
  private
  
  def supervisor_params
    params.require(:supervisor).permit(:id, :first_name, :last_name, :email, :address, :telephone, :role, :organization, :password, :password_confirmation, :signature)
  end
  
end
