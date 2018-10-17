require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:connor)
    ActionMailer::Base.deliveries.clear
  end
  
  test "invalid signup information" do
    get formA_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name: "",
                                         last_name: "",
                                         email: "user@invalid",
                                         student_id: "123abc",
                                         grade: "13" } }
      end
    assert_template 'users/new'
    #assert_select 'div#error_explanation'
    #assert_select 'div.field_with_errors'
  end
  
  test "valid signup information with account activation" do
    get formA_path
    assert_difference ('User.count') do
      post users_path, params: { user: { first_name: "Connor",
                                         last_name: "Harvey",
                                         email: "hello@real.com",
                                         student_id: "123456",
                                         grade: "10",
                                         password: "foobar",
                                         password_confirmation: "foobar" } }
    end
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    # Try to log in before activation.
    log_in_as(user)
    assert_not is_logged_in?
    # Invalid activation token
    get edit_account_activation_path("invalid token", email: user.email)
    assert_not is_logged_in?
    # Valid token, wrong email
    get edit_account_activation_path(user.activation_token, email: 'wrong')
    assert_not is_logged_in?
    # Valid activation token
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
