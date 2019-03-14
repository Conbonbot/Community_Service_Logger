class SupervisorsController < ApplicationController
  
  def new
    @supervisor = Supervisor.new
  end
  
  def create
    @supervisor = Supervior.new(supervisor_params)
  end
  
  def home
  end

  def hours
  end
  
  private
  
  def supervisor_params
    params.require(:supervisor).permit(:id, :first_name, :last_name, :email, :address, :telephone, :role, :organization, :password, :password_confirmation)
  end
  
end
