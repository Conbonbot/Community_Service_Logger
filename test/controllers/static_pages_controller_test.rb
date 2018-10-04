require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get FormA" do
    get static_pages_FormA_url
    assert_response :success
  end

end
