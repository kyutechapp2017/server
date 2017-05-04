require 'test_helper'

class Api::V3::SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v3_schedules_index_url
    assert_response :success
  end

end
