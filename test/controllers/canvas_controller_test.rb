require "test_helper"

class CanvasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get canvas_index_url
    assert_response :success
  end

  test "should get create" do
    get canvas_create_url
    assert_response :success
  end
end
