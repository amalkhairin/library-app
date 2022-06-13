require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do 
    @user = User.new(name: "Gifar")
  end

  test "User should be valid" do
    assert @user.valid?
  end

  test "name should be presence" do 
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do 
    @user.name = "a" * 256
    assert_not @user.valid?
  end
end
