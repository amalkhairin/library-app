# frozen_string_literal: true

require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test 'role should be valid' do
    @role = Role.new(role: 'admin')
    assert @role.valid?
  end

  test 'role should be present' do
    @role = Role.new(role: '')
    assert_not @role.valid?
  end
end
