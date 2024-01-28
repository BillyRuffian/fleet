require "test_helper"

class Administration::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administration_posts_index_url
    assert_response :success
  end
end
