class BookReviewsController < ApplicationController
  before_action :authenticate_request, except: %i[ index ]
  before_action :allowed_review?, only: %i[ create ]
  before_action :set_book_review, :require_same_user,  only: %i[ update ]

  def index 
    @book_reviews = Buku.find_by(id: params[:buku_id]).book_reviews

    render json: {status: "200", reviews: @book_reviews.as_json}
  end

  def create 
    @book_review = BookReview.new(review_params)

    if @book_review.save

      render json: {status: "200", review: @book_review.as_json} 
    else
      render json: {status: :unprocessable_entity, error: @book_review.errors} 
    end
  end

  def update
    
  end

  private 

  def set_book_review
    @book_review = BookReview.find(params[:id])
  end

  def review_params
    defaults = {user_id: @current_user.id}
    params.permit(:rating, :review, :buku_id, :user_id).reverse_merge(defaults)
  end

  def allowed_review?
    book = Buku.find(params[:buku_id])
    render json: {status: "200", message: "never borrowed the book"} if !@current_user.bukus.include?(book)
    render json: {status: "200", message: "already gave a review"} if @current_user.book_reviews.length > 1
  end

  def require_same_user
    render json: {status: "200", message: "only edit your own"} if @current_user.id != @book_review.user_id 
  end
end