class ContestsController < ApplicationController
  
  before_action :find_contest, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_logged_in, only: [:edit, :update, :new, :create, :destroy]
  before_action :ensure_contest_creator, only: [:edit, :update, :new, :create, :destroy]
  
  def index
    @contests = Contest.all
  end
  
  def new
    @contest = current_user.contests.build
  end
  
  def create
    @contest = current_user.contests.build(acceptable_params)
    if @contest.save
      flash[:success] = "Contest created!"
      redirect_to @contest
    else
      flash[:danger] = "Contest could not be created."
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update		
    if @contest.update(acceptable_params)
      flash[:success] = "Contest was updated"
      redirect_to @contest
		else
      flash[:danger] = "Contest could not be updated"
			render 'edit'
		end
  end
  
  def destroy
    if current_user?(@contest.user)
      @contest.destroy
      if @contest.destroy
        flash[:success] = "Contest was deleted"
        redirect_to contests_path
      else
        flash[:danger] = "Could not delete contest"
        redirect_to @contest
      end
    end
  end
  
  private
  def find_contest
    @contest = Contest.find_by_id(params[:id])
  end
  
  def acceptable_params
    params.require(:contest).permit(:name, :description, :contest_type, :referee_id, :start, :deadline)
  end
  
end
