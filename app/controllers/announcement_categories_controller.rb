class AnnouncementCategoriesController < ApplicationController
  before_action :authenticate_request, except: %i[ index ]


  def index 
    @announcement_categories = AnnouncementCategory.all

    render json: {status: "200", announcement_category: @announcement_categories}
  end
end