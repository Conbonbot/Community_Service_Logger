class SupervisorMailer < ApplicationMailer

  def account_activation(supervisor: Supervisor, token: String)
    @supervisor = supervisor
    @supervisor.activation_token = token
    mail(to: @supervisor.email, subject: 'Account Activation | Supervisor' )
  end
  
  def password_reset(supervisor: Supervisor, token: String)
    @supervisor = supervisor
    @supervisor.reset_token = token
    mail to: supervisor.email, subject: "Password Reset"
  end
  
  def supervisor_hour(supervisor, user)
    @supervisor = supervisor
    @user = user
    mail( :to => @supervisor.email, :subject => 'New Request for Community Service')
  end
end
