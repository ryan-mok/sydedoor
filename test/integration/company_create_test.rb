require 'test_helper'

class CompaniesCreateTest < ActionDispatch::IntegrationTest
  test "invalid company creation" do
    get new_company_path
    assert_no_difference 'Company.count' do
      post companies_path, params: { company: { name: "name" } }
    end
    assert_template 'companies/new'
  end

  test "valid company creation" do
    get new_company_path
    assert_difference 'Company.count', 1 do
      post companies_path, params: { company: { name: "the empire",
                                             description: "bring order and peace to the galaxy",
                                             website: "https://wwww.empireState.com"} }
    end
    follow_redirect!
    assert_template 'companies/show'
  end
end
