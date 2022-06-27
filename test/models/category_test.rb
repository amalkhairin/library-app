# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = categories(:category1)
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'category name should be present' do
    @category.name = ''
    assert_not @category.valid?
  end

  test 'category name should not be too long' do
    @category.name = 'a' * 21
    assert_not @category.valid?
  end
end
