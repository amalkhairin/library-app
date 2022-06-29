class AnnouncementCategoriesController < ApplicationController
  before_action :authenticate_request, except: %i[ index ]
  before_action :category_params, only: %i[ create ]
  before_action :require_admin, only: %i[ create ]


  def index 
    @announcement_categories = AnnouncementCategory.all

    render json: {status: "200", announcement_category: @announcement_categories}
  end

  def create 
    @new_category = AnnouncementCategory.new(category_params)

    if @new_category.save
      render json: { status: "200", announcement_category: @new_category.as_json }
    else
      render json: { status: :unprocessable_entity, errors: @new_category.errors }
    end
  end

  private

  def category_params
    params.permit(:category_name)
  end

  def require_admin
    render json: {status: "200", message: "only admin can do this"} if @current_user.role.role != "admin"
  end
end