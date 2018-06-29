class ReviewsController < ApplicationController
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
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :company_id, :rating, :job_title, :term, :year, :salary, :location, :description)
  end
end
