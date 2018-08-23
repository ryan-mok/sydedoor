require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user1)
    @other_user = users(:user2)
    @review = reviews(:review1)
  end


  test "should get new" do
    log_in_as(@user)
    get new_review_path
    assert_response :success
  end

  test "should get index" do
    log_in_as(@user)
    get reviews_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_review_path(@review)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@review), params: { review: { user_id: @review.user.id,
                                                          company_id: @review.company.id,
                                                          rating: 4.5,
                                                          job_title: "Father",
                                                          term: "4A",
                                                          year: 1977,
                                                          salary: "10-20",
                                                          location: "In a galaxy far far away.....",
                                                          description: "" } }

    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_review_path(@review)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get reviews_path
    assert_redirected_to login_url
  end

end
