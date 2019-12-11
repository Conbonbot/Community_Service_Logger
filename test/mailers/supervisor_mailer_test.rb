require 'test_helper'

class SupervisorMailerTest < ActionMailer::TestCase
  test "account_activation" do
    mail = SupervisorMailer.account_activation
    assert_equal "Account Activation | Supervisor", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "password_reset" do
    mail = SupervisorMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
