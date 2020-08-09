require 'test_helper'

class SupervisorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get supervisors_new_url
    assert_response :success
  end

  test "should get home" do
    get supervisors_home_url
    assert_response :success
  end

  test "should get hours" do
    get supervisors_hours_url
    assert_response :success
  end

end
