# Preview all emails at https://b77dbb0330b24dff92cc590200696e73.vfs.cloud9.us-east-2.amazonaws.com/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  def password_reset
    UserMailer.password_reset
  end

end
