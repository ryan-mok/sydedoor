class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order(:name)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      render "new"
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      redirect_to @company
    else
      render "edit"
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :description, :website)
    end
end
