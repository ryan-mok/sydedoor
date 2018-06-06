require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @review = Review.new(user_id: "employedSYDEStudent@uwaterloo.ca", company_id: "Google", rating: 1)
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "user_id should be present" do
    @review.user_id = "   "
    assert_not @review.valid?
  end

  test "company_id should be present" do
    @review.company_id = "   "
    assert_not @review.valid?
  end

  test "rating should be present" do
    @review.rating = "   "
    assert_not @review.valid?
  end

end
