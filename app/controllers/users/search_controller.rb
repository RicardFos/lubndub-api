# Search users by username or email controller
class Users::SearchController < ApplicationController
  skip_before_action :authenticate_request

  def create
    body = JSON.parse(request.raw_post)
    if body['email']
      if User.find_by(email: body['email'])
        user_exists
      else
        user_not_exists
      end
    else
      render json: { message: 'Email must be provided' }, status: :bad_request
    end
  end

  def user_exists
    render json: {message: 'User exists'}
  end

  def user_not_exists
    render json: { message: 'User not exists' }, status: :not_found
  end
end
