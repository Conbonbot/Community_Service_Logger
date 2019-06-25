class HoursController < ApplicationController
   
   def new
      @hour = current_user.hours.build
      @supervisor = Supervisor.new
   end
   
   def create
       @hour = current_user.hours.build(hour_params)
       @hour.approved = nil
       @supervisor = Supervisor.new
       if @hour.save
          if Supervisor.exists?(email: @hour.email)
             @supervisor = Supervisor.find_by(email: @hour.email)
             @supervisor.send_supervisor_email(current_user)
             flash[:info] = "Wating for approve"
             
             redirect_to current_user
          else
             flash[:danger] = "Supervisor not found"
             render 'new'
          end
       else
          render 'new'
       end
   end
   
   
   private
   
   def hour_params
      params.require(:hour).permit(:content, :email,
      supervisor: [:id,:first_name, :email, :telephone])
   end
   
   
end