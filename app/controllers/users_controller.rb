class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :telephone)
  end
end
