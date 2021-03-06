ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'minitest/autorun'
Minitest::Reporters.use!(Minitest::Reporters::ProgressReporter.new,ENV,Minitest.backtrace_filter)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Returns true if the test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

 # Log in as a particular user
   def log_in_as(user)
    session[:user_id] = user.id
   end

# Add more helper methods to be used by all tests here...
  def log_in_as(user, password: 'password', remember_me: "1")
    post login_path, { session: { email: user.email, 
                                  password: password, 
                                  remember_me: remember_me} }
  end
end







