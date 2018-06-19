class CompaniesController < ApplicationController

  def index
    @companies = Company.all
    render html: "TODO: company display page"
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(@company)    # Not the final implementation!
    if @company.save
      redirect_to @company
    else
      render 'companies/createNewCompany'
    end
  end

  def company_params
    params.require(:company).permit(:name, :description, :website)
  end

end
