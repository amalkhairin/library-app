class BookReviewsController < ApplicationController
  before_action :authenticate_request, except: %i[ index ]

  def index 
    @book_reviews = Buku.find_by(id: params[:buku_id]).book_reviews

    render json: {status: "200", reviews: @book_reviews.as_json}
  end

  def create 
    @book_review = BookReview.new(review_params)
    binding.break
    if @book_review.save
      binding.break
      render json: {status: "200", review: @book_review.as_json} 
    else
      render json: {status: :unprocessable_entity, error: @book_review.errors} 
    end
  end

  private 

  def review_params
    defaults = {user_id: @current_user.id}
    params.permit(:rating, :review, :buku_id, :user_id).reverse_merge(defaults)
  end
end