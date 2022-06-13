require "test_helper"

class RoleTest < ActiveSupport::TestCase
  test "role should be valid" do 
    @role = Role.new(role: "admin")
    assert @role.valid? 
  end
end