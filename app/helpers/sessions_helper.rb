module SessionsHelper
    
    # Logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def supervisor_log_in(supervisor)
        session[:supervisor_id] = supervisor.id
    end
    

    
    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    def supervisor_remember(supervisor)
        supervisor.remember
        cookies.permanent.signed[:supervisor_id] = supervisor.id
        cookies.permanent[:remember_token] = supervisor.remember_token
    end
    
    # Returns true if the given user is the current user
    def current_user?(user)
        user == current_user
    end
    
    def current_supervisor?(supervisor)
      supervisor == current_supervisor
    end
    
    # Returns the user corresponding to the remember token cookie
    def current_user
        if(user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif(user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(:remember, cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end
    
    def current_supervisor
        if(supervisor_id = session[:supervisor_id])
            @current_supervisor ||= Supervisor.find_by(id: supervisor_id)
        elsif(supervisor_id = cookies.signed[:supervisor_id])
            supervisor = Supervisor.find_by(id: user_id)
            if supervisor && supervisor.authenticated?(:remember, cookies[:remember_token])
                log_in supervisor
                @current_supervisor = supervisor
            end
        end
    end
    
    # Returns true if the user is logged in, false otherwise
    def logged_in?
        !current_user.nil?
    end
    
    def supervisor_logged_in?
        !current_supervisor.nil?
    end
    
    # Logs out a current user
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
    
    def supervisor_log_out
        forget(current_supervisor)
        session.delete(:supervisor_id)
        @current_supervisor = nil
    end
    
    # forgets a persistent session
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    def forget(supervisor)
        supervisor.forget
        cookies.delete(:supervisor_id)
        cookies.delete(:remember_token)
    end
    
    def redirect_back_or(default)
        redirect_to(session[:return_to] || default)
        session.delete(:return_to)
    end
    
    # Returns the total hours of a logged in user
    def total
        if logged_in? or current_user.admin?
          tot = 0
          hours = Hour.where(user_id: current_user.id, approved: true)
          for x in 0..hours.count-1
            tot += hours[x].content
          end
          return tot
        end
    end

end
