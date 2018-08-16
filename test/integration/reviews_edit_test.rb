require "test_helper"

class ReviewsEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    @company = companies(:company1)
    @review = reviews(:review1)

    log_in_as(@user)

    @review.user = @user
    @review.company = @company
    @review.save!
  end

  test "unsuccessful edit" do
    get edit_review_path(@review)
    assert_template "reviews/edit"
    patch review_path(@review), params: { review: { user_id: @review.user.id,
                                                    company_id: @review.company.id,
                                                    rating: 4.5,
                                                    job_title: "Father",
                                                    term: "4A",
                                                    year: 1977,
                                                    salary: "10-20",
                                                    location: "In a galaxy far far away.....",
                                                    description: "" } }

    assert_template "reviews/edit"
  end

  test "successful edit" do
    get edit_review_path(@review)
    assert_template "reviews/edit"
    term = "2B"
    job_title = "Product Owner"
    patch review_path(@review), params: { review: { user_id: @review.user.id,
                                                    company_id: @review.company.id,
                                                    rating: 4.5,
                                                    job_title: job_title,
                                                    term: term,
                                                    year: 1977,
                                                    salary: "10-20",
                                                    location: "In a galaxy far far away.....",
                                                    description: "Job can be pretty stressful at times but has awesome perks like cool suits. Great CEO XD" } }
    assert_not flash.empty?
    assert_redirected_to @review
    @review.reload
    assert_equal job_title, @review.job_title
    assert_equal term, @review.term
  end
end
