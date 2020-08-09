# Preview all emails at http://localhost:3000/rails/mailers/supervisor_mailer
class SupervisorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/supervisor_mailer/account_activation
  def account_activation
    supervisor = Supervisor.first
    supervisor.activation_token = Supervisor.new_token
    SupervisorMailer.account_activation(supervisor)
  end


  # Preview this email at http://localhost:3000/rails/mailers/supervisor_mailer/password_reset
  def password_reset
    SupervisorMailer.password_reset
  end

end
