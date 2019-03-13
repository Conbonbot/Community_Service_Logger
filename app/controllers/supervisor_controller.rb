class SupervisorController < ApplicationController
  
  def home
    @supervisor = Supervisor.new
  end
  
  
end
