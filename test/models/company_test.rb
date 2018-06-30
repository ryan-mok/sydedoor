require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = Company.new(name: 'Galactic Empire', description: 'hunt down every last rebel scum', website: 'https://www.empirestrikesback.org')
  end

  test 'should be valid' do
    assert @company.valid?
  end

  test 'name should be present' do
    @company.name = ''
    assert_not @company.valid?
  end
end
