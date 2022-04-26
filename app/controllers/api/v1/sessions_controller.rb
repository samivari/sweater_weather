class Api::V1::SessionsController < ApplicationController
  def create
    params[:email] = JSON.parse(request.raw_post)['email']
    params[:password] = JSON.parse(request.raw_post)['password']

    user = User.find_by(email: params[:email])
    user.authenticate(params[:password])
    session[:user_id] = user.id
    render json: UserSerializer.new(user)
  end
end
