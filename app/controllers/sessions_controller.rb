class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(student_id: params[:session][:student_id])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid ID or password"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
