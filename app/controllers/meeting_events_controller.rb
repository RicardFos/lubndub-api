class MeetingEventsController < ApplicationController
  before_action :set_meeting_event, only: [:show, :update, :destroy]

  # GET /meeting_events
  def index
    @meeting_events = MeetingEvent.all

    render json: @meeting_events
  end

  # GET /meeting_events/1
  def show
    render json: @meeting_event
  end

  # POST /meeting_events
  def create
    @meeting_event = MeetingEvent.new(meeting_event_params)

    if @meeting_event.save
      render json: @meeting_event, status: :created, location: @meeting_event
    else
      render json: @meeting_event.errors, status: :unprocessable_entity
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

  # DELETE /meeting_events/1
  def destroy
    @meeting_event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_event
      @meeting_event = MeetingEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_event_params
      params.require(:meeting_event).permit(:title, :description)
    end
end
