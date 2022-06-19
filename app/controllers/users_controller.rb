class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[ create ]
  before_action :set_user, only: %i[ show update destroy ]
  before_action :require_same_user_or_admin, only: %i[ destroy ]

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, statu: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: {error: "only admin can delete account"}
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :telephone, :role_id, :birthday, :address, :gender, :is_active)
  end

  def require_same_user_or_admin
    if @current_user.role.role != "admin" || @current_user.id != @user.id
      render json: {error: "you can't delete other user"}
    end
  end

end
