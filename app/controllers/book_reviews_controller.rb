class BookReviewsController < ApplicationController
  before_action :authenticate_request, except: %i[ index ]

  def index 
    @book_reviews = Buku.find_by(id: params[:buku_id]).book_reviews

    render json: {status: "200", reviews: @book_reviews.as_json}
  end
end