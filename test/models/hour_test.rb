require 'test_helper'

class HourTest < ActiveSupport::TestCase
  def setup
    @user = users(:connor)
    @hour = @user.hours.build(content: "2")
  end
  
  test "should be valid" do
    assert @hour.valid?
    debugger
  end
  
  test "user id should be present" do
    @hour.user_id = nil
    assert_not @hour.valid?
  end
  
  test "hour should be present" do
    @hour.content = nil
    assert_not @hour.valid?
  end
  
  test "hour shouldn't have letters" do
    @hour.content = "hello"
    assert_not @hour.valid?
  end
  
  test "hour shouldn't have both letters and numbers" do
    @hour.content = "he11o"
    assert_not @hour.valid?
  end
  
  test "hour should have numbers" do
    @hour.content = "5"
    assert @hour.valid?
  end
  
  test "order should be most recent first" do
    assert_equal hours(:most_recent), Hour.first
  end
  
  
end
