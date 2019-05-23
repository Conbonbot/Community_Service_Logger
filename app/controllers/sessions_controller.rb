class SessionsController < ApplicationController
  def new
  end
  
  def pre
  end
  
  def create
    user = User.find_by(student_id: params[:session][:student_id])
    if user && user.authenticate(params[:session][:password])
      if user.activated
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Account not activated. "
        message += "Check your email for the activation link"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid ID or password"
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  def new_sup
  end
  
  def create_sup
    supervisor = Supervisor.find_by(email: params[:session][:email].downcase)
    if supervisor && supervisor.authenticate(params[:session][:password])
      if supervisor.activated
        supervisor_log_in supervisor
        params[:session][:remember_me] == '1' ? remember(supervisor) : forget(supervisor)
        redirect_back_or supervisor
        #redirect_to supervisors_url(supervisor)
      else
        message = "Account not activated. "
        message += "Check your email for the activation link"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid ID or password"
      render 'new'
    end
  end
  
  def destroy_sup
    supervisor_log_out if supervisor_logged_in?
    redirect_to root_url
  end
end

