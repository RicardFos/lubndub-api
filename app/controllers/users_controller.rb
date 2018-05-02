class UsersController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, except: json_exclude
  end

  # GET /users/user_auth_token
  def show
    render json: @user, except: json_exclude
  #  render_from @user.to_json(except: json_exclude)
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/user_auth_token
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/user_auth_token
  def destroy
    @user.destroy
    render json: "User deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(user_auth_token: params[:user_auth_token])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name,:last_name, :email, :password, :gender, :date_of_birth)
    end

    def json_exclude
    [:id, :password_digest, :email, :created_at, :updated_at]
    end

end
