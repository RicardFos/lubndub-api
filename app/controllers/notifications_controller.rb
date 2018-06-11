class NotificationsController < ApplicationController
  #skip_before_action :authenticate_request

  # GET /user/user_auth_token/notifications
  def index
    set_user
    if is_authorized
      @notifications = @user.notifications.all
      render json: @notifications
      @notifications.destroy
    else
      unauthorized_message
    end
  end

  def index_notifications
    render json: Notification.all
  end

  # GET /notifications/1
  def show
    set_user
    if is_authorized
      render json: @user.participations.find(params[:id])
    else
      unauthorized_message
    end
  end

  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: @notification, status: :created, location: @notification
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notifications/1
  def update
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_user
      @user = User.find_by!(user_auth_token: params[:user_auth_token])
    end

    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:user_id, :subject, :action, :target)
    end

    def is_authorized
      if @user == @current_user
        return true
      else
        return false
      end
    end

    def unauthorized_message
      render json: {message: "You can't access the notifications from other users"}
    end


end
