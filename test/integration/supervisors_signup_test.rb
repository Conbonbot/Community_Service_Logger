require 'test_helper'

class SupervisorsSignupTest < ActionDispatch::IntegrationTest
    
    test "proper signup" do
        get supervisor_path
    end

end
