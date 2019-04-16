module SessionsHelper
    
    # Logs in the given user
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end
    
    # Returns true if the given user is the current user
    def current_user?(user)
        user == current_user
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
    
    # Returns true if the user is logged in, false otherwise
    def logged_in?
        !current_user.nil?
    end
    
    # Logs out a current user
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
    
    # forgets a persistent session
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    def redirect_back_or(default)
        redirect_to(session[:return_to] || default)
        session.delete(:return_to)
    end
    
    # Returns the total hours of a user
    def total
      tot = 0
      for x in 1..current_user.hours.count(:content)
         if current_user.hours.find_by(id:x).approved == true
            tot += current_user.hours.find_by(id: x).content
         end
      end
      return tot
    end

end
