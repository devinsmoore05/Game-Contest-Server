class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		acceptable_params = params.require(:user).permit(:username, :password, :password_confirmation)	
		@user = User.new(acceptable_params)
		if @user.save then
			#redirect_to user_path(@user) Same thing as line below.
			redirect_to @user # Basically give it a 301, then request GET with user details.
		else
			#This will keep whatever elements they previously typed that worked. We remember.
			render 'new'
		end
	end
end
