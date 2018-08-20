class CompaniesController < ApplicationController
  autocomplete :company, :name, :extra_data => [:name, :description], full: true, limit: 1000

  def index
    @companies = Company.all
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

  def select_company
    @company = Company.new
  end

  def get_company
    @company = Company.find(params[:id])
    render :json => @company
  end

  def selected_company?

  end

  private

    def company_params
      params.require(:company).permit(:name, :description, :website)
    end
end
