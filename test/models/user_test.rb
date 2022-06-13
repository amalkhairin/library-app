require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do 
    @user = User.new(name: "Gifar", email: "halo@example.com")
  end

  test "User should be valid" do
    assert @user.valid?
  end

  test "name should be present" do 
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do 
    @user.name = "a" * 256
    assert_not @user.valid?
  end

  test "name should be a letter" do 
    @user.name = "3abj"
    assert_not @user.valid?
  end

  test "email should be present" do 
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should be valid" do 
    @user.email = "example@gmail"
    assert_not @user.valid?
  end

  test "email should be uniq" do 
    @user.save
    @user2 = User.new(name: "Fulan", email: "halo@example.com")
    assert_not @user2.valid?
  end
end
