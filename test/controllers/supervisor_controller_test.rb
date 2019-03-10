require 'test_helper'

class SupervisorControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get supervisor_home_url
    assert_response :success
  end

end
