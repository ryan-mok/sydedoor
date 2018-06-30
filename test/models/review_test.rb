require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
      first_name: 'Han',
      last_name: 'Solo',
      email: 'hsolo@milfalcon.com',
      password: 'password',
      password_confirmation: 'password'
    )

    @review = Review.create(
      rating: 4.5,
      job_title: 'Father',
      term: '4A',
      year: 1977,
      salary: '10-20',
      location: 'In a galaxy far far away.....',
      description: 'Job can be pretty stressful at times but has awesome perks like cool suits. Great CEO XD'
    )

    @company = Company.create(
      name: 'Galactic Empire',
      description: 'hunt down every last rebel scum',
      website: 'https://www.empirestrikesback.org'
    )

    @review.user = @user
    @review.company = @company
    @review.save! # Required for has_many associations of user and company to work
  end

  test 'should be valid' do
    assert @review.valid?
  end

  test 'user_id should be present' do
    @review.user_id = '   '
    assert_not @review.valid?
  end

  test 'company_id should be present' do
    @review.company_id = '   '
    assert_not @review.valid?
  end

  test 'rating should be present' do
    @review.rating = '   '
    assert_not @review.valid?
  end

  test 'job_title should be present' do
    @review.job_title = '   '
    assert_not @review.valid?
  end

  test 'term should be present' do
    @review.term = '   '
    assert_not @review.valid?
  end

  test 'year should be present' do
    @review.year = ''
    assert_not @review.valid?
  end

  test 'salary should be present' do
    @review.salary = '   '
    assert_not @review.valid?
  end

  test 'location should be present' do
    @review.location = '   '
    assert_not @review.valid?
  end

  test 'description should be present' do
    @review.description = '   '
    assert_not @review.valid?
  end
end
