require "test_helper"

class BookReviewTest < ActiveSupport::TestCase
  setup do
    @review = book_reviews(:review1)
  end

  test "book review should be valid" do
    assert @review.valid?
  end

  test "book review rating should be present" do
    @review.rating = nil
    assert_not @review.valid?
  end

  test "book review rating should be integer" do
    @review.rating = "A"
    assert_not @review.valid?
  end

  test "book review rating should not be greater than 5" do
    @review.rating = "A"
    assert_not @review.valid?
  end
end
