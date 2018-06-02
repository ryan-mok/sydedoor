class UsersController < ApplicationController

	def index
		render html: "TODO: user display page"
	end
	
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)    # Not the final implementation!
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	private
		def user_params
	  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
end
