class HoursController < ApplicationController
   
   def new
      @hour = current_user.hours.build
      @supervisor = Supervisor.new
   end
   
   def create
       @hour = current_user.hours.build(hour_params)
       @supervisor = Supervisor.new
       if @hour.save
          flash[:success] = "Hour Inputed"
          redirect_to current_user
       end
   end
   
   
   private
   
   def hour_params
      params.require(:hour).permit(:content)
   end
end
