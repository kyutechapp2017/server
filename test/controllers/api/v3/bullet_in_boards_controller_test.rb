require 'test_helper'

class Api::V3::BulletInBoardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v3_bullet_in_boards_index_url
    assert_response :success
  end

end
