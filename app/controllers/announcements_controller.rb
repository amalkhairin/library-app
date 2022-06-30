class AnnouncementsController < ApplicationController
  before_action :authenticate_request, except: %i[ show ]
  before_action :set_announcement, only: %i[ show update destroy ]
  before_action :require_admin, only: %i[ create update destroy ]

  def show
    render json: {status: "200", announcement: @announcement.as_json}.to_json
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.user = @current_user if @current_user.role.role = 'admin'

    if @announcement.save
      render json: {status: "200", announcement: @announcement}
    else
      render json: {status: :unprocessable_entity, error: @announcement.errors}
    end
  end

  def update
    if @announcement.update(announcement_params)
      render json: {status: "200", messages: "OK", announcement: @announcement.as_json}
    else
      render json: {status: "200", error: @announcement.errors}
    end
  end

  def destroy
    @announcement.destroy
    
    render json: {status: "OK", message: "announcement has been deleted"}
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