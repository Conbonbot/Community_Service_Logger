require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example", last_name: "User", indent: "111111")
  end
 
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  
  test "last name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end
  
  test "indent should be present" do
    @user.indent = "     "
    assert_not @user.valid?
  end
  
  test "indent should not be too short(minimum)" do
   @user.indent = "a" * 5
    assert_not @user.valid?
  end
  
  test "indent should not be too short(maximum)" do
  @user.indent = "a" * 7
  assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "last name should not be too long" do
    @user.last_name = "a" * 51
    assert_not @user.valid?
  end
  
   test "indent should be numbers" do
    @user.indent = "1234as"
    assert_not @user.valid?
  end

  test "indent should have 6 numbers" do
    @user.indent = "1234567"
    assert_not @user.valid?
    @user.indent = "12345"
    assert_not @user.valid?
   end
end
