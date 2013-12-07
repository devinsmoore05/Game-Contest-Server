class MatchesController < ApplicationController
  
  def index
    @matches = Match.all
  end
  
  def new
    @match = current_user.matches.build
  end
  
  def create
  end
  
  def show
    @match = Match.find_by_id(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
