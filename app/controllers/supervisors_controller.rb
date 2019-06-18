class SupervisorsController < ApplicationController
  before_action :validate_url_hack, only: [:edit, :update]
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
    @approves = Hour.where(email: @supervisor.email, approved: nil)
  end
  
  def approve
  end
  
  def yes
    @supervisor = current_supervisor
    @approves = Hour.where(email: @supervisor.email, approved: nil)
    @hour = Hour.find(params[:id])
    @hour.approve_hour
    redirect_to current_supervisor
  end
  
  def no
    @supervisor = current_supervisor
    @approves = Hour.where(email: @supervisor.email, approved: nil)
    @hour = Hour.find(params[:id])
    @hour.deny_hour
    redirect_to current_supervisor
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
   
  def validate_url_hack
    unless params[:id].to_i == current_supervisor.id
      flash[:danger] = "Please log in"
      redirect_to root_url
    end
  end
   
  
  
end