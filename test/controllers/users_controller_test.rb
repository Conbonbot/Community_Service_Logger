require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "Form A | Community Service Logger"
  end
  
  test "should get FormB" do
    get formB_path
    assert_response :success
    assert_select "title", "Form B | Community Service Logger"
  end
  
  test "should get FormC" do
    get formC_path
    assert_response :success
    assert_select "title", "Form C | Community Service Logger"
  end

end
