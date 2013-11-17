module UsersHelper
  
    def ensure_user_logged_in
      unless logged_in? #Unless logged_in? is TRUE.
        flash[:warning] = "Not logged in"
      redirect_to login_path 
      end
    end
    
    def ensure_correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "Not correct user"
        redirect_to root_path
      end
    end
    
    def ensure_admin
      unless current_user.admin?
        flash[:danger] = "Not Admin!"
        redirect_to root_path
      end
    end

  def ensure_contest_creator
    unless current_user.contest_creator?
      flash[:danger] = "Not contest creator!"
      redirect_to root_path 
    end
  end
  
end
