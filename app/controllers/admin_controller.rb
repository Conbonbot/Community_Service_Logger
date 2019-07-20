class AdminController < ApplicationController
  
  def home
    @users = User.all
    @supervisors = Supervisor.all
  end
end
