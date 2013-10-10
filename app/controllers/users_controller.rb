class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		acceptable_params = params.require(:user).permit(:username, :password, :password_confirmation, :email)	
		@user = User.new(acceptable_params)
		if @user.save then
      flash[:success] = "Welcome to the site: #{@user.username}"
			#redirect_to user_path(@user) Same thing as line below.
			redirect_to @user # Basically give it a 301, then request GET with user details.
		else
			#This will keep whatever elements they previously typed that worked. We remember.
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])#This is a special case. Don't need to do the same process as above. id is the one element of the params hash that this is true for.
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(acceptable_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end



	private
	
		def acceptable_params
			params.require(:user).permit(:username, :password, :password_confirmation, :email)
		end

end
