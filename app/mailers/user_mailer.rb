class UserMailer < ApplicationMailer


  def account_activation(user)
    @user = user
    debugger
    mail( :to => @user.email, :subject => 'Account Activation | Student' )
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end

  def test_email(user)
    @user = user
    mail(to: @user.email, subject: "Test Email")
  end
end
