class HoursController < ApplicationController
   
   def new
      @hour = Hour.new
      @supervisor = Supervisor.new
   end
   
   def create
       @hour = current_user.hours.build(hour_params)
       @hour.approved = nil
       @hour.email = @hour.email.downcase
       @supervisor = Supervisor.new
       if @hour.save
             @supervisor = Supervisor.find_by(email: @hour.email)
             if @supervisor.nil?
                @supervisor = Supervisor.new(email: @hour.email)
             end
             @supervisor.send_supervisor_email(current_user)
             flash[:info] = "Wating for approve"
             redirect_to current_user
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