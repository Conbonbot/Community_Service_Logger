class AdminController < ApplicationController
  def home
    @users = User.all
  end
  
  def freshmen
  end
  
  def sophomores
    @users = User.grade = Time.zone.now.year + 1
  end
    
end
