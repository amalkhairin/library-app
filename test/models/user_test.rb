require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do 
    @user = User.new(name: "Gifar", email: "halo@example.com", username: "gifaraja")
    @user2 = User.new(name: "fulan", email: "halo1@example.com", username: "gifaraja1")
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
    @user2.email = "halo@example.com"
    assert_not @user2.valid?
  end

  test "username should be present" do 
    @user.username = ""
    assert_not @user.valid?
  end

  test "username should be uniq" do 
    @user.save
    @user2.username = "gifaraja"
    assert_not @user2.valid?
  end

  test "username shouldn't be too long" do 
    @user.username = "a" * 21
    assert_not @user.valid?
  end

  test "username shouldn't be too short" do 
    @user.username = "aa" 
    assert_not @user.valid?
  end
end
