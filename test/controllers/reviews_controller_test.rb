require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_review_path
    assert_response :success
  end

  test "should get index" do
    get reviews_path
    assert_response :success
  end
end
