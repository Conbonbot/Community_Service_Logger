require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup
   @user = users(:connor)
   @prash = users(:prash)
 end
 
 
 # Name tests
 
 test "first name should be present" do
   @user.first_name = "      "
   assert_not @user.valid?
 end
 
 test "last name should be present" do
   @user.last_name = "       "
   assert_not @user.valid?
 end
 
 test "names shouldn't be too long" do
   @user.first_name = "a" * 51
   assert_not @user.valid?
   @user.last_name =  "a" * 51
   assert_not @user.valid?
 end
 
 # Email tests
 
 test "email should be present" do
   @user.email = " "
   assert_not @user.valid?
 end
 
 test "email shouldn't be too long" do
  @user.email = "a" * 244 + "@example.com"
  assert_not @user.valid?
 end
 
 
 test "email validation should reject invalid emails" do
  invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
  invalid_addresses.each do |invalid_address|
   @user.email = invalid_address
   assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  end
 end
 
 test "email addresses should be unique" do
  duplicate_user = @user.dup
  duplicate_user.email = @user.email.upcase
  @user.save
  assert_not duplicate_user.valid?
 end
 
 test "email addresses should be saved as lower-case" do
  mixed_case_email = "ExamPLE@rAILstutorial.ORg"
  @user.email = mixed_case_email
  @user.save
  assert_equal mixed_case_email.downcase, @user.reload.email
 end
 
 # Student id tests
 
 test "ID should have 6 numbers" do
  @user.student_id = "12345"
  assert_not @user.valid?
  @user.student_id = "1234567"
  assert_not @user.valid?
 end
 
 test "ID should only contain numbers" do
  @user.student_id = "123abc"
  assert_not @user.valid?
 end
 
 test "ID should be unique" do
  duplicate_user = @user.dup
  @user.save
  assert_not duplicate_user.valid?
 end
 
 # Grade tests
 
 test "Grade should be between this year to 4 years" do
  @user.grade = Time.zone.now.year
  assert @user.valid?
  @user.grade = Time.zone.now.year + 1
  assert @user.valid?
  @user.grade = Time.zone.now.year + 2
  assert @user.valid?
  @user.grade = Time.zone.now.year + 3
  assert @user.valid?
  @user.grade = Time.zone.now.year + 4
  assert @user.valid?
 end
 
 test "Grade should reject invalid years" do
  @user.grade = Time.zone.now.year - 1
  assert_not @user.valid?
  @user.grade = Time.zone.now.year + 5
  assert_not @user.valid?
 end
 
 
 test "Grade shouldn't contain letters" do
  @user.grade = "hello"
  assert_not @user.valid?
 end
 
 # Password tests
 
 test "password shouldn't be blank" do
  @user.password = @user.password_confirmation = " " * 6
  assert_not @user.valid?
 end
 
 test "password should have a minimum length" do
  @user.password = @user.password_confirmation = "a" * 5
  assert_not @user.valid?
 end
 
 # Cookies tests
 
 test "authenticated? should return false for a user with nil digest" do
  assert_not @user.authenticated?(:remember, '')
 end 
 
 # Hour tests
 
 test "associated hours should be destroyed" do
  @prash.save
  @prash.hours.create!(content: 2)
  assert_difference 'Hour.count', -1 do
   @prash.destroy
  end
 end
 

end
