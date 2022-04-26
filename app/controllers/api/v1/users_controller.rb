class Api::V1::UsersController < ApplicationController
  def create
    params[:user] = JSON.parse(request.raw_post)
    user = User.new(user_params)
    render(json: UserSerializer.new(user), status: :created)
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
end
