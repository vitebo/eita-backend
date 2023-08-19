require "test_helper"

class ContentControllerTest < ActionDispatch::IntegrationTest
  test "should get like" do
    get content_like_url
    assert_response :success
  end

  test "should get deslike" do
    get content_deslike_url
    assert_response :success
  end
end
