class SupervisorMailer < ApplicationMailer

  def account_activation(supervisor)
    @supervisor = supervisor
    mail to: supervisor.email, subject: "Account activtion"
  end
  
  def password_reset
    @greeting = "Hi"
    mail to: "to@example.com"
  end
end
