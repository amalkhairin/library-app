# frozen_string_literal: true

require 'test_helper'

class BookReviewTest < ActiveSupport::TestCase
  setup do
    @review = book_reviews(:review1)
  end

  test 'book review should be valid' do
    role = roles(:visitor)

    user = User.create(
              name: 'Gifar Aja', 
              email: 'halo@example.com', 
              username: 'gifaraja', 
              telephone: '0812345678910',
              password: 'admin1',
              role_id: role.id
           )
                   
    @review.user_id = user.id 
    @review.buku_id = bukus(:book1).id

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
