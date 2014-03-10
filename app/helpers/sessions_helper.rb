module SessionsHelper

  def current_user
    return nil if session[:session_token].nil?
    Session.find_user_by_session_token(session[:session_token])
  end
  
  def login_user(user)
    new_session = user.sessions.create!
    session[:session_token] = new_session.token
  end
  
  def logout_user
    Session.find_by_token(session[:session_token]).destroy
    session[:session_token] = nil
  end
  
  def require_current_user!
    unless current_user
      flash[:errors] = "You must be logged in to do that!"
      redirect_to new_session_url
    end
  end
  
  def require_no_user!
    redirect_to home_url if !!current_user
  end
  
  def require_admin!
    if current_user.type != "Admin"
      flash[:errors] = "You don't have permission to do that."
      redirect_to home_url
    end
  end

end