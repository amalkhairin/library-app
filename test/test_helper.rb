ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include JsonWebToken

  def sign_in_as(user)
    check = post login_path, params: {  email: user.email, password: "admin1" }
    jwt_encode(user_id: @user.id) if check == 200
  end
end
