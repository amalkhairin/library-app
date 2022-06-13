require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do 
    @user = User.new()
  end

  test "User should be valid" do
    assert @user.valid?
  end
end
