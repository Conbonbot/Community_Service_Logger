require "test_helper"

class HourMailerTest < ActionMailer::TestCase
  test "send_request_email" do
    mail = HourMailer.send_request_email
    assert_equal "Send request email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
