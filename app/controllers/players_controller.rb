class PlayersController < ApplicationController
  
  def new
    @player = current_user.players.build
  end 
  
  def create
  end
  
end
