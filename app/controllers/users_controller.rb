# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[create]
  before_action :set_user, only: %i[show update destroy]
  before_action :require_same_user_or_admin, only: %i[destroy update]

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
    binding.break
    @user = User.new(user_params)
    if @user.save
      @user.profile = set_profile(@user.email)
      render json: @user, statu: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: { success: 'deleted successfully' }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_profile(_user_email)
    email_address = params[:user][:email]
    hash = Digest::MD5.hexdigest(email_address)
    "https://www.gravatar.com/avatar/#{hash}"
  end

  def user_params
    defaults = { role_id: 2 }
    params.require(:user).permit(:name, :email, :username, :password, :telephone, :role_id, :birthday, :address,
                                 :gender, :is_active).reverse_merge(defaults)
  end

  def require_same_user_or_admin
    if @current_user.role.role != 'admin' && @current_user.id != @user.id
      render json: { error: "you can't delete or edit  other user" }
    end
  end
end
