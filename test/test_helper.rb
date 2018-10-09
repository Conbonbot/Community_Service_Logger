ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test user is logged in
  def is_logged_in?
    !session[:user_id].nil?
  end
  
  # Logs in as a particular user
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  
  # Logs in as a particular user
  def log_in_as(user, student_id: '123456', remember_me: '1')
    post login_path, params: { session: { student_id: user.student_id,
                                          password: 'password',
                                          remember_me: remember_me } }
  end
end