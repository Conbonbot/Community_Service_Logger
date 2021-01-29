class HourMailer < ApplicationMailer

  def hour_request_email(hour: Hour)
    @hour = params[:hour]
    @user = User.find(@hour.user_id)
    mail to: @hour.email, subject: 'New Request for Community Service'
  end
end
