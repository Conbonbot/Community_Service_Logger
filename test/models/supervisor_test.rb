require 'test_helper'

class SupervisorTest < ActiveSupport::TestCase
  def setup
    @supervisor = Supervisor.new(first_name: "Prash", last_name: "Bhask", email: "example@important.org", address:"2222 Important Dr.", telephone: "818-555-5555", role: "Coder", organization: "CV-Enterprises",
                                 password: "supervisor", password_confirmation: "supervisor")
  end
  
  test "should be valid" do
    assert @supervisor.valid?
  end
  
  test "names should be valid" do
    @supervisor.first_name = " "
    assert_not @supervisor.valid?
    @supervisor.last_name = " "
    assert_not @supervisor.valid?
  end
  
  test "email should be present" do
    @supervisor.email = " "
    assert_not @supervisor.valid?
  end
  
  test "address should be present" do
    @supervisor.address = " "
    assert_not @supervisor.valid?
  end
  
  test "telephone should be present" do
    @supervisor.telephone = " "
    assert_not @supervisor.valid?
  end
  
  test "role should be present" do
    @supervisor.role = " "
    assert_not @supervisor.valid?
  end
  
  test "organization should be present" do
    @supervisor.organization = " "
    assert_not @supervisor.valid?
  end
  
  test "password should be present" do
    @supervisor.password = @supervisor.password_confirmation = " " * 6
    assert_not @supervisor.valid?
  end
  
  test "password should have a minimum length" do
    @supervisor.password = @supervisor.password_confirmation = "a" * 5
    assert_not @supervisor.valid?
  end
  
end
