# frozen_string_literal: true

class SearchController < ApplicationController
  skip_before_action :authenticate_request

  def search_title
    @bukus = Buku.search(search_params)

    render json: @bukus
  end

  private

  def search_params
    params.permit(:title)
  end
end
