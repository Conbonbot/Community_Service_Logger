class SupervisorsController < ApplicationController
  
  def new
    @supervisor = Supervisor.new
  end
  
  def create
   Supervisor.new = Supervior.create(supervisor_params)
    if @supervisor.save
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
    params.require(:supervisor).permit(:id, :first_name, :last_name, :email, :address, :telephone, :role, :organization, :password, :password_confirmation, :signature)
  end
  
  def exists(string)
    return @supervisor.email = Supervisor.find(params[:email])
  end
  
end
