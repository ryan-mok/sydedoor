class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  def index
    render html: 'TODO: user display page'
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to SydeDoor!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.save!
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # Confirms a logged in user and flashes a notice to log in
  def logged_in_user
    unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end
end
