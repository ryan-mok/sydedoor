require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    @user = users(:user1)
    log_in_as(@user)
    get new_review_path
    assert_response :success
  end

  test "should get index" do
    @user = users(:user1)
    log_in_as(@user)
    get reviews_path
    assert_response :success
  end
end
