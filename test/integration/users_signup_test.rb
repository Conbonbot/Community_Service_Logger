require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
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
end
