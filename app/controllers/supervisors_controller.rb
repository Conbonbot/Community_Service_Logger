class SupervisorsController < ApplicationController
  
  def new
    @supervisor = Supervisor.new
  end
  
  def create
    @supervisor = Supervior.new(supervisor_params)
    if @supervisor.save
      flash[:success] = "Welcome"
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
