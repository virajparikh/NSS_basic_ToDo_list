ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
Capybara.default_driver = :selenium

DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  def startup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
	#Make the Capybara DSL available in all integration tests
	include Capybara::DSL
	self.use_transactional_fixtures = false
end