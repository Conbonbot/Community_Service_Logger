class SupervisorsController < ApplicationController
  before_action :correct_supervisor, only: [:show]
  before_action :not_users
  
  
  def new
    @supervisor = Supervisor.new
  end
  
  def create
    @supervisor = Supervisor.create(supervisor_params)
    if @supervisor.save
      @supervisor.send_activation_email
      redirect_to root_url
      flash[:info] = "Please check your email to activate your account"
      #@supervisor.activate
      #supervisor_log_in(@supervisor)
      #redirect_to @supervisor
      #flash[:success] = "Account Created and Activated"
    else
      render 'new'
    end
  end
  
  def approved
    @supervisor = current_supervisor
    @approved = Hour.where(email: @supervisor.email, approved: true)
  end
  
  def done
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
    @user = User.find(@hour.user_id)
    @user.new100 = true
    @user.level = "Se"
    @user.save
    redirect_to current_supervisor
  end
  
  def no
    @supervisor = current_supervisor
    @approves = Hour.where(email: @supervisor.email, approved: nil)
    @hour = Hour.find(params[:id])
    @hour.deny_hour
    redirect_to current_supervisor
  end
  
  def supervisor_params
    params.require(:supervisor).permit(:id, :first_name, :last_name, :email, :address, :telephone, :role, :organization, :password, :password_confirmation, :access_code, { hour: [:content, :approved]})
  end
  
  private
  
  def correct_supervisor
    @supervisor = Supervisor.find(params[:id])
    if supervisor_logged_in?
      if !current_supervisor?(@supervisor)
        redirect_to(supervisor_login_path)
        flash[:warning] = "Must be the Correct Supervisor"
      end
    else
      if logged_in?
        if !current_user.admin?
          log_out
          flash[:waring] = "You make me angry"
        end
      end
      if !logged_in?
        redirect_to(supervisor_login_path)
        flash[:danger] = "Login as a Supervisor to access your account"
      end
    end
  end
  
  def not_users
    #byebug
    if logged_in?
      if !current_user.admin?
        redirect_to(root_url)
        flash[:danger] = "You are a student. Don't touch that 😡"
        #redirect_to 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', :overwrite_params => { :parm => 'foo' }
      end
    end
  end
  

  
end

