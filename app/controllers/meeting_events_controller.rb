class MeetingEventsController < ApplicationController
  before_action :set_meeting_event, only: [:show, :update, :destroy]
  #skip_before_action :authenticate_request

  # GET /users/user_auth_token/meeting_events
  def index
    set_user
    if is_authorized
      @meeting_event = @user.meeting_events.all
      render json: @meeting_event
    else
      unauthorized_message
    end
  end

  # GET /meeting_events/1
  def show
    render json: @meeting_event
  end

  # POST /users/user_auth_token/meeting_events
  def create
    fetch_params
    if is_authorized
      @meeting_event = @user.meeting_events.build(sport_id: @sport.id)
      @meeting_event.update(meeting_event_params)
      if @meeting_event.save
         render json: @meeting_event
      else
        render json: @meeting_event.errors, status: :unprocessable_entity
      end
    else
      unauthorized_message
    end

  end

  # PATCH/PUT /meeting_events/1
  def update
    if @meeting_event.update(meeting_event_params)
      render json: @meeting_event
    else
      render json: @meeting_event.errors, status: :unprocessable_entity
    end
  end

  def index_events
    render json: MeetingEvent.all
  end

  # DELETE /users/user_auth_token/meeting_events/event_auth_token
  def destroy
    set_user
    if is_authorized
      @meeting_event = @user.meeting_events.find_by(event_auth_token: params[:event_auth_token])
      @meeting_event.destroy
    else
      unauthorized_message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_event
      @meeting_event = MeetingEvent.find_by!(event_auth_token: params[:event_auth_token])
    end

    def set_user
      @user = User.find_by!(user_auth_token: params[:user_auth_token])
    end

    def fetch_params
      @user = User.find_by!(user_auth_token: params[:user_auth_token])
      @sport = Sport.find_by!(sport_auth_token: params[:sport_auth_token])
    end


    def unauthorized_message
      render json: {message: "You can't access the events from other users"}
    end


    def is_authorized
      if @user == @current_user
        return true
      else
        return false
      end
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_event_params
      params.require(:meeting_event).permit(:title, :description, :location, :latitude,
      :longitude, :date, :start_time, :end_time, :status, :exp_level, :group_class, :gender, :min_age,
      :max_age, :min_users, :max_users, :privacy, :meeting_event_type, :event_type, :periodic, :periodic_interval, :sport_auth_token)
    end
end
