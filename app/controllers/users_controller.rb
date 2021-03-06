class UsersController < ApplicationController
  before_action :ensure_user_logged_in, only: [:edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :ensure_admin, only: [:destroy]
  
  respond_to :html, :json, :xml #says I'm expecting requests for data in these three formats and willing to respond.
  
	def index
		@users = User.all
    respond_with(@users)
	end

	def new
    if !logged_in?
		@user = User.new
    respond_with(@user)
    else
      flash[:warning] = "You must log out to create a user!"
      redirect_to root_path
    end
	end

	def create
    if !logged_in?
		  acceptable_params = params.require(:user).permit(:username, :password, :password_confirmation, :email)	
		  @user = User.new(acceptable_params)
      if @user.save
        cookies.signed[:user_id] = @user.id
        flash[:success] = "Welcome to the site #{@user.username}"
			  #redirect_to user_path(@user) Same thing as line below.
			  #redirect_to @user # Basically give it a 301, then request GET with user details.
        respond_with(@users)
		  else
			  #This will keep whatever elements they previously typed that worked. We remember.
			  render 'new'
		  end
    else
      flash[:warning] = "You must log out to create a user!"
      redirect_to root_path
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
      flash[:success] = "User was updated"
			redirect_to @user
      #respond_with(@users)
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
    if !current_user?(@user)
		  @user.destroy
      flash[:success] = "User was deleted"
		  redirect_to users_path
    else
      flash[:danger] = "Don't delete yourself!"
      redirect_to root_path
    end
	end



	private
	
		def acceptable_params
			params.require(:user).permit(:username, :password, :password_confirmation, :email)
		end   

end
