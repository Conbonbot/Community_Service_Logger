class AccountActivationController < ApplicationController
    
    def edit
        debugger
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
            user.activate
            log_in user
            flash[:success] = "Account activated!"
            redirect_to user
        else
            flash[:danger] = "Invalid activation link"
            redirect_to root_url
        end
    end
    
    def sup_edit
        supervisor = Supervisor.find_by(email: params[:email])
        if supervisor && !supervisor.activated? && supervisor.authenticated?(:activation, params[:id])
            supervisor.activate
            supervisor_log_in(supervisor)
            flash[:success] = "Account activated!"
            redirect_to supervisor
        else
            flash[:danger] = "Invalid activation link"
            redirect_to root_url
        end
    end
end
