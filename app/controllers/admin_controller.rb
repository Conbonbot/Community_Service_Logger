class AdminController < ApplicationController
  
  layout 'application', :except => [:home]
  
  def home
    @users = User.all
    @supervisors = Supervisor.all
  end
end
