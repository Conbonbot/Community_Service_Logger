class SupervisorsController < ApplicationController
  
  def new
    @supervisor = Supervisor.new
  end
  
  def create
    @supervisor = Supervisor.create(supervisor_params)
    if @supervisor.save
      @supervisor.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
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
    params.require(:supervisor).permit(:id, :first_name, :last_name, :email, :address, :telephone, :role, :organization, :password, :password_confirmation, :signature, { hour: [:content, :approved]})
  end
  
  
end