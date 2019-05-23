class SupervisorsController < ApplicationController
  before_action :logged_in_supervisor, only: [:edit, :update]
  before_action :correct_supervisor,   only: [:edit, :update]
  
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
  
  def show
    @supervisor = Supervisor.find(params[:id])
  end
  
  def home
  end

  def hours
  end
  
  private
  
  def supervisor_params
    params.require(:supervisor).permit(:id, :first_name, :last_name, :email, :address, :telephone, :role, :organization, :password, :password_confirmation, :signature, { hour: [:content, :approved]})
  end
  
  def logged_in_supervisor
    unless logged_in_supervisor
       flash[:danger] = "Please log in"
       redirect_to root_url
    end
  end
   
   def correct_supervisor
     @supervisor = Supervisor.find(params[:id])
     redirect_to(root_url) unless @supervisor == current_supervisor?(@supervisor)
   end
  
  
end