class ReviewBukusController < ApplicationController
    before_action :set_review_buku, only: %i[ show update destroy ]

    # GET /review_bukus
    def index
        @review_bukus = ReviewBuku.all

        render json: @review_bukus
    end

    # GET /review_bukus/1
    def show
        render json: @review_buku
    end

    # DELETE /review_bukus/1
    def destroy
        @review_buku.destroy
    end

    # POST /review_bukus
    def create
        @review_buku = ReviewBuku.new(review_buku_params)
    
        if @review_buku.save
          render json: @review_buku, status: :created, location: @review_buku
        else
          render json: @review_buku.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /review_bukus/1
    def update
        if @review_buku.update(review_buku_params)
            render json: @review_buku
        else
            render json: @review_buku.errors, status: :unprocessable_entity
        end
    end




    private
        def set_review_buku
            @review_buku = ReviewBuku.find(params[:id])
        end

       
        def review_buku_params
            params.require(:review_buku).permit(:user_id, :buku_id, :ulasan, :rating)
        end
    


end
