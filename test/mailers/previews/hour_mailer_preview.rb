# Preview all emails at http://localhost:3000/rails/mailers/hour_mailer
class HourMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/hour_mailer/send_request_email
  def send_request_email
    HourMailer.send_request_email
  end

end
