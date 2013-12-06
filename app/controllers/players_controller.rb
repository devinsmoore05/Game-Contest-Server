class PlayersController < ApplicationController
  
  before_action :ensure_user_logged_in, only: [:edit, :update, :new, :create, :destroy]
  
  # /contests/:contest_id/players/new
  def new
    contest = Contest.find(params[:contest_id])
    @player = current_user.contest.players.build
  end 
  
  # /contests/:contest_id/players
  def create
    contest = Contest.find(params[:contest_id])
    @player = contest.players.build(acceptable_params)
    if @player.save
      flash[:success] = "Player created!"
      redirect_to @player
    else
      render 'new'
    end
  end
  
  def index
    @players = Player.all
  end
  
  def show
    @player = Player.find(params[:id])
  end
  
  def edit
    @player = Player.find(params[:id])
  end
  
  def update
    @player = Player.find(params[:id])
    if @player.update(acceptable_params)
      flash[:success] = "Player was updated"
      redirect_to @player
		else
      render 'edit'
		end
  end
  
  def destroy
    @player = Player.find(params[:id])
    if current_user?(@player.user)
      if @player.destroy
        #File::delete(@player.file_location)
        flash[:success] = "Player was deleted"
        redirect_to players_path
      else
        flash[:danger] = "Could not delete player"
        redirect_to @player
      end
    end
  end
  
  def acceptable_params
    params.require(:player).permit(:name, :description, :downloadable, :playable)
  end
  
end
