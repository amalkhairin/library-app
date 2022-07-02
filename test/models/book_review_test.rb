# frozen_string_literal: true

require 'test_helper'

class BookReviewTest < ActiveSupport::TestCase
  setup do
    @review = book_reviews(:review1)
  end

  test 'book review should be valid' do
    assert @review.valid?
  end

  test 'book review rating should be present' do
    @review.rating = nil
    assert_not @review.valid?
  end

  test 'book review rating should be integer' do
    @review.rating = 'A'
    assert_not @review.valid?

    @review.rating = 0.44
    assert_not @review.valid?
  end

  test 'book review rating should not be greater than 5' do
    @review.rating = 7
    assert_not @review.valid?
  end

  test 'book review rating should nopt be less than 1' do
    @review.rating = 0
    assert_not @review.valid?
  end

  test 'book review should be present' do
    @review.review = ''
    assert_not @review.valid?
  end

  test 'book review should not be too long' do
    @review.review = 'a' * 101
    assert_not @review.valid?
  end
end
