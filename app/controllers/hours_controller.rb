class HoursController < ApplicationController
   
   def new
      @hour = current_user.hours.build
      @supervisor = Supervisor.new
   end
   
   def create
       @hour = current_user.hours.build(hour_params)
       @supervisor = @hour.supervisor
       if @hour.save
          flash[:info] = "Waiting for approve"
          redirect_to current_user
       end
   end
   
   
   private
   
   def hour_params
      params.require(:hour).permit(:content, :approved, supervisor_attributes: [:id, :first_name, :last_name, :email, :telephone])
   end
end