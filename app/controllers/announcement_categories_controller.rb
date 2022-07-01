class AnnouncementCategoriesController < ApplicationController
  before_action :authenticate_request, except: %i[ index ]
  before_action :set_category_params, only: %i[ update destroy ]
  before_action :require_admin, only: %i[ create update destroy ]


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

  def update
    if @new_category.update(category_params)
      render json: {status: "200", new_category_announcement: @new_category.as_json}
    else
      rener json: {status: :unprocessable_entity, errors: @new_category.errors }
    end
  end

  def destroy
    @new_category.destroy
    render json: {status: "200", messages: 'deleted successfully'}
  end

  private

  def set_category_params
    @new_category = AnnouncementCategory.find(params[:id])
  end

  def category_params
    params.permit(:category_name)
  end

  def require_admin
    render json: {status: "200", message: "only admin can do this"} if @current_user.role.role != "admin"
  end
end