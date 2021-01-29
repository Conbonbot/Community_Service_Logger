class HoursController < ApplicationController
    before_action :correct_delete, only: [:delete]
   
   def new
      @hour = Hour.new
      @supervisor = Supervisor.new
   end
   
   def delete
      @hour = Hour.find(params[:id])
   end
   
   def full_delete
       Hour.find(params[:id]).delete
       redirect_to current_user
       flash[:success] = "Request deleted"
   end
   
   def create
       @hour = current_user.hours.build(hour_params)
       @hour.approved = nil
       @hour.email = @hour.email.downcase
       if @hour.save
          @supervisor = Supervisor.find_by(email: @hour.email)
         if @supervisor.nil?
            @hour.send_request_email(@hour)
         else
           @supervisor.send_supervisor_email(current_user)
         end
          flash[:info] = "Waiting for approval"
          redirect_to current_user
       else
          render 'new'
       end
   end
   
   
   private
   
   def hour_params
      params.require(:hour).permit(:content, :email, :organization,
      supervisor: [:id,:first_name, :email, :telephone])
   end
   
   def correct_delete
       redirect_to(root_url) unless Hour.find(params[:id]) == current_user.hours.find(params[:id])
   end
   
   
end