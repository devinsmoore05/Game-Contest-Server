class RefereesController < ApplicationController
  
  before_action :ensure_user_logged_in, only: [:edit, :update, :new, :create, :destroy]
  before_action :ensure_contest_creator, only: [:edit, :update, :new, :create, :destroy]
  
  def new #Purpose is to supply the view with information: the form so that they can input information. So, set up the form.
    @referee = current_user.referees.build #This makes it specific to the user that is logged in.
  end
  
  def create #Receives data from new and makes a referee.
    @referee = current_user.referees.build(acceptable_params)    
    if @referee.save
      flash[:success] = "Referee created!"
      redirect_to @referee
    else
      render 'new'
    end
  end

  def index
    @referees = Referee.all
  end
  
  def show
    @referee = Referee.find(params[:id])
    
  end
  
  def acceptable_params
    params.require(:referee).permit(:name, :rules_url, :players_per_game, :upload)
  end

  def destroy
    @referee = Referee.find(params[:id])
    if current_user?(@referee.user)
      if @referee.destroy
        File::delete(@referee.file_location)
        flash[:success] = "Referee was deleted"
        redirect_to referees_path
      else
        flash[:danger] = "Could not delete referee"
        redirect_to @referee
      end
    end
  end
  
  def edit
    @referee = Referee.find(params[:id])
	end

  def update
    @referee = Referee.find(params[:id])
    if @referee.update(acceptable_params)
      flash[:success] = "Referee was updated"
      redirect_to @referee
		else
      render 'edit'
		end
	end
  
end
