require "test_helper"

class BookReviewTest < ActiveSupport::TestCase
  setup do
    @review = book_reviews(:review1)
  end

  test "book review should be valid" do
    assert @review.valid?
  end
end
