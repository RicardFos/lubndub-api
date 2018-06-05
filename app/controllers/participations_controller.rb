class ParticipationsController < ApplicationController
  #skip_before_action :authenticate_request

  # GET /users/user_auth_token/participations
  def index
    set_user
    if is_authorized
      @participations = @user.participations.all
      render json: @participations
    else
      unauthorized_message
    end
  end

  # GET /users/user_auth_token/participations/meeting_event_id
  def show
    set_user
    if is_authorized
      render json: @user.participations.find_by(meeting_event_id: params[:id])
    else
    #  render json: @user.as_json
      unauthorized_message
    end
  end


  # GET /users/user_auth_token/events_participating
  def index_events_participating
    set_user
    @meeting_events = []
      @participations = @user.participations.all
    @participations.each do |participation|
      @meeting_events << participation.meeting_event
    end
      render json: @meeting_events
  end


    # GET /meeting_events/event_auth_token/users_participating
    def index_users_participating
      set_meeting_event
      @users = []
        @participations = @meeting_event.participations.all
      @participations.each do |participation|
        @users << participation.user
      end
        render json: @users
    end




  # POST /user/user_auth_token/participations
  def create
    fetch_params
    if is_authorized
      if !@user.participations.find_by(meeting_event_id: @meeting_event.id)
        @participation = @user.participations.build(meeting_event_id: @meeting_event.id)
        if @participation.save
           render json: @participation
        else
          render json: @participation.errors, status: :unprocessable_entity
        end
      else
        render json: {message: "Already exists"}
      end
    else
      unauthorized_message
    end
  end

  # PATCH/PUT /participations/1
  def update
  #  if @participation.update(participation_params)
  #    render json: @participation
  #  else
  #    render json: @participation.errors, status: :unprocessable_entity
  #  end
  end

  # DELETE /users/user_auth_token/participations/meeting_event_id
  def destroy
    set_user
    if is_authorized
      @participation = @user.participations.find_by(meeting_event_id: params[:id])
      @participation.destroy
    else
      unauthorized_message
    end
  end

  def fetch_params
    @user = User.find_by!(user_auth_token: params[:user_auth_token])
    @meeting_event = MeetingEvent.find_by!(event_auth_token: params[:event_auth_token])
  end

  def set_user
    @user = User.find_by!(user_auth_token: params[:user_auth_token])
  end

  def set_meeting_event
    @meeting_event = MeetingEvent.find_by!(event_auth_token: params[:event_auth_token])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def participation_params
      params.fetch(:participation, {})
    end

    def is_authorized
      if @user == @current_user
        return true
      else
        return false
      end
    end

    def unauthorized_message
      render json: {message: "You can't access the participations from other users"}
    end
end
