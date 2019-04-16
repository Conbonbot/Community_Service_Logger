module HoursHelper
    
  # returns true if the hour is approved
  def approved?
      hour.approved?
  end
  
  # returns the total approved values of the user
  def total
      tot = 0
      for x in 0..@user.hours.count(:content)
         tot += @user.hours.find(x) and @user.hours.find(x).approved?
      end
      return tot
  end
end
