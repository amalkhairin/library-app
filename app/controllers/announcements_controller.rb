class AnnouncementsController < ApplicationController
  before_action :authenticate_request, except: %i[ show ]
  before_action :set_announcement, only: %i[ show ]
  before_action :require_admin, only: %i[ create ]

  def show
    render json: {status: "200", announcement: @announcement.as_json}
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      render json: {status: "200", announcement: @announcement}
    else
      render json: {status: :unprocessable_entity, error: @announcement.errors}
    end
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.permit(:title, :description)
  end

  def require_admin
    render json: {status: "200", message: "only admin can do this"} if @current_user.role.role != 'admin'
  end
end