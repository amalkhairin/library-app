# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { email: @user.email, token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
