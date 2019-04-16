class HoursController < ApplicationController
   
   def new
      @hour = current_user.hours.build
      @supervisor = Supervisor.new
   end
   
   def create
       @hour = current_user.hours.build(hour_params)
       #@hour.update_attribute(:approved, false)
       @supervisor = Supervisor.find_by(params[@hour.email])
       if @hour.save
          if @supervisor.nil?
             flash[:danger] = "Supervisor not found"
             render 'new'
          else
             flash[:info] = "Waiting for approve"
             redirect_to current_user
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