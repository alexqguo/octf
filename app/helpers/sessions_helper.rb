module SessionsHelper

  def current_user
    User.find_by_session_token(session[:session_token])
  end
  
  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end
  
  def logout_current_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
  
  def require_current_user!
    if current_user.nil?
      flash[:errors] = "You must be logged in to do that!"
      redirect_to new_session_url
    end
  end
  
  def require_no_user!
    redirect_to athletes_url if current_user
  end

end