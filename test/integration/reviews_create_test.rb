require "test_helper"

class ReviewsCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    log_in_as(@user)
  end

  test "invalid review creation" do
    get new_review_path
    assert_no_difference "Review.count" do
      post reviews_path, params: { review: { rating: -1 } }
    end
    assert_template "reviews/new"
  end

  test "valid review creation" do
    get new_review_path
    assert_difference "Review.count", 1 do
      post reviews_path, params:
        {
          review:
            {
              user_id: users(:user1).id,
              company_id: companies(:company1).id,
              rating: 4.5,
              job_title: "Father",
              term: "4A",
              year: 1977,
              salary: "10-20",
              location: "In a galaxy far far away.....",
              description: "Job can be pretty stressful at times but has awesome perks like cool suits. Great CEO XD"
            }
        }
    end
    follow_redirect!
    assert_template "reviews/show"
  end
end
