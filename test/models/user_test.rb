require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do 
    @role = Role.create(role: "admin")
    @user = User.new(name: "Gifar Aja", email: "halo@example.com", username: "gifaraja", telephone: "0812345678910", password: "admin1")
    @user.role = @role
    @user2 = User.new(name: "fulan", email: "halo1@example.com", username: "gifaraja1", telephone: "0812345678911", password: "admin2")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  # validation test for name

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

  # validation test for email

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

  # validation test for username

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

  # validation test for password

  test "password should be present" do 
    @user.password_digest = ""
    assert_not @user.valid?
  end

  test "password should not be too short" do 
    @user.password = "abc"
    assert_not @user.valid? 
  end

  # validation test for telephone number

  test "telphone number should be present" do 
    @user.telephone = ""
    assert_not @user.valid?
  end

  test "telephone should be string number" do 
    @user.telephone = "891827984e71"
    assert_not @user.valid?
  end
  
end
