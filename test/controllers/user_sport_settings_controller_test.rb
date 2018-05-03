require 'test_helper'

class UserSportSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_sport_setting = user_sport_settings(:one)
  end

  test "should get index" do
    get user_sport_settings_url, as: :json
    assert_response :success
  end

  test "should create user_sport_setting" do
    assert_difference('UserSportSetting.count') do
      post user_sport_settings_url, params: { user_sport_setting: { exp_level: @user_sport_setting.exp_level, group_class: @user_sport_setting.group_class, last_minutes: @user_sport_setting.last_minutes, raius: @user_sport_setting.raius } }, as: :json
    end

    assert_response 201
  end

  test "should show user_sport_setting" do
    get user_sport_setting_url(@user_sport_setting), as: :json
    assert_response :success
  end

  test "should update user_sport_setting" do
    patch user_sport_setting_url(@user_sport_setting), params: { user_sport_setting: { exp_level: @user_sport_setting.exp_level, group_class: @user_sport_setting.group_class, last_minutes: @user_sport_setting.last_minutes, raius: @user_sport_setting.raius } }, as: :json
    assert_response 200
  end

  test "should destroy user_sport_setting" do
    assert_difference('UserSportSetting.count', -1) do
      delete user_sport_setting_url(@user_sport_setting), as: :json
    end

    assert_response 204
  end
end
