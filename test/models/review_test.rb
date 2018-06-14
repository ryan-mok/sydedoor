require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @review = Review.new(user_id: "darthvader@rebel4lyfe.ca",
                         company_id: "Death Star Inc.",
                         rating: 4.5,
                         job_title: "Father",
                         term: "4A",
                         year: 1977,
                         salary: "10-20",
                         location: "In a galaxy far far away.....",
                         review_desc: "Job can be pretty stressful at times but has awesome perks like cool suits. Great CEO XD")
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

  test "job_title should be present" do
    @review.job_title = "   "
    assert_not @review.valid?
  end

  test "term should be present" do
    @review.term = "   "
    assert_not @review.valid?
  end

  test "year should be present" do
    @review.year = ""
    assert_not @review.valid?
  end

  test "salary should be present" do
    @review.salary = "   "
    assert_not @review.valid?
  end

  test "location should be present" do
    @review.location = "   "
    assert_not @review.valid?
  end

  test "review_desc should be present" do
    @review.review_desc = "   "
    assert_not @review.valid?
  end

end
