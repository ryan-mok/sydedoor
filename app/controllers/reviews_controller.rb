class ReviewsController < ApplicationController
  before_action :logged_in_user, only: %i[index create new edit update destroy]
  before_action :correct_user,   only: %i[edit update destroy]
  autocomplete :company, :name, full: true, limit: 1000

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user ||= current_user
    if @review.save
      redirect_to @review
    else
      render "new"
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:success] = "Review Updated"
      redirect_to @review
    else
      render "edit"
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review Deleted"
    redirect_to reviews_path
  end

  private

    def review_params
      params
        .require(:review)
        .permit(:user_id, :company_id, :rating, :job_title, :term, :year, :salary, :location, :description)
    end

    def logged_in_user
      return if logged_in?

      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end

    def correct_user
      @review = Review.find(params[:id])
      @user = User.find_by(id: @review.user_id)

      redirect_to(root_url) unless current_user?(@user)
    end
end
