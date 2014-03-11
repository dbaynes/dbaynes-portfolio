ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(role =:author)
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end
  
  def sign_in(role =:editor)
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end
end
