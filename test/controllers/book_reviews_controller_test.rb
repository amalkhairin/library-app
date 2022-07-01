require "test_helper"

class BookReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = bukus(:book1)

    @role1 = Role.create(role: 'admin')
    @role2 = Role.create(role: 'visitor')

    @user = User.create(name: 'Gifar', email: 'halo@example.com', username: 'gifaraja', 
                        telephone: '0812345678910',password: 'admin1', role_id: 1)
    @user2 = User.create(name: 'Gifar Kedua', email: 'halo2@example.com', username: 'gifaraja2',
                         telephone: '0812345678911', password: 'admin1', role_id: 2)

    @admin_token = sign_in_as(@user)
    @user_token = sign_in_as(@user2)
    
    @review1 = BookReview.create(buku_id: @book.id, user_id: @user.id, rating: 5, review: "bukunya bagus")
    @review2 = BookReview.create(buku_id: @book.id, user_id: @user2.id, rating: 4, review: "bukunya bagus banget")
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

    post "/buku/#{@book.id}/reviews", params: { rating: 2, review: "kurang bagus"}, headers: {HTTP_AUTHORIZATION: "JWT #{@user_token}"}

    assert_includes(@book.book_reviews, @user2.book_reviews[0])
    assert_response :success
  end

  test 'should not create new book review on spesific book if the user never borrowed the book' do 
    @user2.bukus = []

    post "/buku/#{@book.id}/reviews", params: { rating: 2, review: "kurang bagus"}, headers: {HTTP_AUTHORIZATION: "JWT #{@user_token}"}

    assert_not_includes(@book.book_reviews, @user2.book_reviews[0])
    assert_response :success
  end
end
