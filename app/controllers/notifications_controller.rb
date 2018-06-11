class NotificationsController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_notification, only: [:show, :update, :destroy]

  # GET /user/user_auth_token/otifications
  def index
    @notifications = Notification.all

    render json: @notifications
  end

  def index_notifications
    render json: MeetingEvent.all
  end

  # GET /notifications/1
  def show
    render json: @notification
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
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notification_params
      params.require(:notification).permit(:user_id, :subject, :action, :target)
    end
end