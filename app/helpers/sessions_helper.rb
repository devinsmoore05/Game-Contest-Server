module SessionsHelper
  #Methods that deal with sessions resources, but that we want to use throughout our site.
  def current_user
    @current_user ||= User.find_by_id(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end
  
  def current_user?(user)
    current_user == user
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  #Will need additional helpers
end
