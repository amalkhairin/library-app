# frozen_string_literal: true

require 'test_helper'

class BookReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = bukus(:book1)

    @user = User.create(
                name: 'Gifar', 
                email: 'halo@example.com', 
                username: 'gifaraja',
                telephone: '0812345678910', 
                password: 'admin1', 
                role_id: roles(:admin).id
            )

    @user2 = User.create(
                name: 'Gifar Kedua', 
                email: 'halo2@example.com', 
                username: 'gifaraja2',
                telephone: '0812345678911', 
                password: 'admin1', 
                role_id: roles(:visitor).id
            )

    @admin_token = sign_in_as(@user)
    @user_token = sign_in_as(@user2)

    @review1 = BookReview.create(buku_id: @book.id, user_id: @user.id, rating: 5, review: 'bukunya bagus')
    @review2 = BookReview.create(buku_id: @book.id, user_id: @user2.id, rating: 4, 
                                 review: 'bukunya bagus banget')
  end

  test 'should get all review on spesific book' do
    get "/buku/#{@book.id}/reviews"
    assert_response :success
  end

  test 'should create new book review on spesific book if the user has borrowed the book' do
    assert_difference('@user2.peminjaman_bukus.count', 1) do
      post "/buku/#{@book.id}/peminjaman_buku", params: { buku_id: @book.id },
                                                headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    post "/buku/#{@book.id}/reviews", params: { rating: 2, review: 'kurang bagus' },
                                      headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }

    assert_includes(@book.book_reviews, @user2.book_reviews[0])
    assert_response :success
  end

  test 'should not create new book review on spesific book if the user never borrowed the book' do
    @user2.bukus = []

    post "/buku/#{@book.id}/reviews", params: { rating: 2, review: 'kurang bagus' },
                                      headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }

    assert_not_includes(@book.book_reviews, @user2.book_reviews[0])
    assert_response :success
  end

  test 'should not create new book review on spesific book if already gave a review' do
    assert_difference('@user2.peminjaman_bukus.count', 1) do
      post "/buku/#{@book.id}/peminjaman_buku", params: { buku_id: @book.id },
                                                headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    # add first review
    post "/buku/#{@book.id}/reviews", params: { rating: 2, review: 'kurang bagus' },
                                      headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }

    assert_includes(@book.book_reviews, @user2.book_reviews[0])

    # should not add second review
    assert_no_difference('@book.book_reviews.length') do
      post "/buku/#{@book.id}/reviews", params: { rating: 1, review: 'kurang bagus' },
                                        headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }
    end

    assert_response :success
  end

  test 'should update review if same user' do
    old_rating = @review2.rating
    old_review = @review2.review

    patch "/buku/#{@book.id}/reviews/edit/#{@review2.id}", 
           params: { rating: 5, review: 'bukunya bagus, sangat jelas' },
           headers: { HTTP_AUTHORIZATION: "JWT #{@user_token}" }

    assert_equal(false, old_rating != @review2.rating)
    assert_equal(false, old_review != @review2.review)
  end

  test 'should not edit review if not same user' do
    old_rating = @review2.rating
    old_review = @review2.review

    patch "/buku/#{@book.id}/reviews/edit/#{@review2.id}", 
          params: { rating: 5, review: 'bukunya bagus, sangat jelas' },
          headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }

    assert_equal(true, old_rating == @review2.rating)
    assert_equal(true, old_review == @review2.review)
  end

  test 'should delete review if admin' do
    assert_difference('@book.book_reviews.length', -1) do
      delete "/buku/#{@book.id}/reviews/delete/#{@review2.id}", 
              params: {},
              headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :success
  end
end
