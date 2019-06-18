class SupervisorMailer < ApplicationMailer

  def account_activation(supervisor)
    @supervisor = supervisor
    mail( :to => @supervisor.email, :subject => 'Account Activation | Supervisor')
  end
  
  def password_reset
    @greeting = "Hi"
    mail to: "to@example.com"
  end
end
