require 'test_helper'

class MeetingEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting_event = meeting_events(:one)
  end

  test "should get index" do
    get meeting_events_url, as: :json
    assert_response :success
  end

  test "should create meeting_event" do
    assert_difference('MeetingEvent.count') do
      post meeting_events_url, params: { meeting_event: { description: @meeting_event.description, title: @meeting_event.title } }, as: :json
    end

    assert_response 201
  end

  test "should show meeting_event" do
    get meeting_event_url(@meeting_event), as: :json
    assert_response :success
  end

  test "should update meeting_event" do
    patch meeting_event_url(@meeting_event), params: { meeting_event: { description: @meeting_event.description, title: @meeting_event.title } }, as: :json
    assert_response 200
  end

  test "should destroy meeting_event" do
    assert_difference('MeetingEvent.count', -1) do
      delete meeting_event_url(@meeting_event), as: :json
    end

    assert_response 204
  end
end
