require 'test_helper'

class ReviewsCreateTest < ActionDispatch::IntegrationTest
  test "invalid review creation" do
    get new_review_path
    assert_no_difference 'Review.count' do
      post reviews_path, params: { review: { user_id: 0, company_id: 0 } }
    end
    assert_template 'reviews/new'
  end

  test "valid review creation" do
    get new_review_path
    assert_difference 'Review.count', 1 do
      post reviews_path, params: { review: { user_id: 0, company_id: 0, description: "my description", rating: 0 } }
    end
    follow_redirect!
    assert_template 'reviews/show'
  end
end
