require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:connor)
  end
 
  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "Form A | Community Service Logger"
  end
  
  

end
