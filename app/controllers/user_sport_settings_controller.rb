class UserSportSettingsController < ApplicationController
#  skip_before_action :authenticate_request

  # GET /user_sport_settings
  def index
    set_user
    if is_authorized
      @user_sport_settings = @user.user_sport_settings.all
      render json: @user_sport_settings
    else
      unauthorized_message
    end
  end

  # GET /user_sport_settings/1
  def show
    set_user
    if is_authorized
      render json: @user.user_sport_settings.find(params[:id])
    else
    #  render json: @user.as_json
      unauthorized_message
    end
  end

  # POST /user_sport_settings
  def create
    fetch_params
    if is_authorized
      if !@user.user_sport_settings.find_by(sport_id: @sport.id)
        @user_sport_setting = @user.user_sport_settings.build(sport_id: @sport.id)
        @user_sport_setting.update(user_sport_setting_params)
        if @user_sport_setting.save
           render json: @user_sport_setting
        else
          render json: @user_sport_setting.errors, status: :unprocessable_entity
        end
      else
        render json: {message: "Already exists"}
      end
    else
      unauthorized_message
    end
  end

  # PATCH/PUT /user_sport_settings/sport_id
  def update
    set_user
    if is_authorized
      @user_sport_setting = @user.user_sport_settings.find_by(sport_id: params[:id])
      if @user_sport_setting.update(user_sport_setting_params)
        render json: @user_sport_setting
      else
        render json: @user_sport_setting.errors, status: :unprocessable_entity
      end
    else
      unauthorized_message
    end
  end

  # DELETE /user_sport_settings/sport_id
  def destroy
    set_user
    if is_authorized
      @user_sport_setting = @user.user_sport_settings.find_by(sport_id: params[:id])
      @user_sport_setting.destroy
    else
      unauthorized_message
    end
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

    def is_authorized
      if @user == @current_user
        return true
      else
        return false
      end
    end

    def unauthorized_message
      render json: {message: "You can't access the settings from other users"}
    end
end
