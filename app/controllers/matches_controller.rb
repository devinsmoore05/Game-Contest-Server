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
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
