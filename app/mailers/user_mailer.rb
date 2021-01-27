class UserMailer < ApplicationMailer


  def account_activation(user: User, token: String)
    @user = params[:user]
    @user.activation_token = params[:token]
    mail(to: @user.email, subject: 'Account Activation | Student' )
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end


end
