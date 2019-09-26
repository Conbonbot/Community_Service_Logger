class SupervisorsController < ApplicationController
  before_action :correct_supervisor, only: [:show]
  before_action :not_user
  
  
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
    params.require(:supervisor).permit(:id, :first_name, :last_name, :email, :address, :telephone, :role, :organization, :password, :password_confirmation, :access_code, { hour: [:content, :approved]})
  end
  
  def correct_supervisor
    @supervisor = Supervisor.find(params[:id]) 
    if supervisor_logged_in?
        if !current_supervisor?(@supervisor)
          redirect_to(root_url)
          flash[:warning] = "Must be the correct supervisor"
        end
    else
      if !current_user.nil?
        if !current_user.admin?
          flash[:warning] = "Don't Even Try"
        end
      else
        redirect_to(root_url)
        flash[:warning] = "Must be the correct supervisor"
      end
    end
  end
  
  def not_user
    if current_supervisor.nil?
      if !logged_in?
          redirect_to(root_url)
          flash[:danger] = "Bruh"
      elsif !current_user.admin?
        redirect_to 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', :overwrite_params => { :parm => 'foo' }
      end
    end
  end
  
end

