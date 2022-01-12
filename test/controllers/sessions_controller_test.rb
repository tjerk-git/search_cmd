require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get magic_link" do
    get sessions_magic_link_url
    assert_response :success
  end
end
