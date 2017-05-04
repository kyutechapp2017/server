require 'test_helper'

class BulletInBoardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bullet_in_board_index_url
    assert_response :success
  end

end
