class UserSportSettingsController < ApplicationController
  skip_before_action :authenticate_request

  # GET /user_sport_settings
  def index
    set_user
    @user_sport_settings = @user.user_sport_settings.all

    render json: @user_sport_settings
  end

  # GET /user_sport_settings/1
  def show
    set_user
    render json: @user.user_sport_settings.find(params[:id])
  end

  # POST /user_sport_settings
  def create
    fetch_params
    @user_sport_setting = @user.user_sport_settings.build(sport_id: @sport.id)
    @user_sport_setting.update(user_sport_setting_params)

    if @user_sport_setting.save
    else
      render json: @user_sport_setting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_sport_settings/1
  def update
    if @user_sport_setting.update(user_sport_setting_params)
      render json: @user_sport_setting
    else
      render json: @user_sport_setting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_sport_settings/1
  def destroy
    @user_sport_setting.destroy
  end

  private

    def fetch_params
      @user = User.find_by!(user_auth_token: params[:user_auth_token])
      @sport = Sport.find_by!(sport_auth_token: params[:sport_auth_token])
    end

    def set_user
      @user = User.find_by!(user_auth_token: params[:user_auth_token])
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_user_sport_setting
      @user_sport_setting = UserSportSetting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_sport_setting_params
      params.require(:user_sport_setting).permit(:exp_level, :group_class, :radius, :last_minutes)
    end
end
