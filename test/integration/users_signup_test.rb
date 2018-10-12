require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:connor)
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
  
  test "valid signup information" do
    get formA_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name: "Connor",
                                         last_name: "Harvey",
                                         email: "user@valid.com",
                                         student_id: "123456",
                                         grade: "10",
                                         password: "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

end
