class SessionsController < ApplicationController
  
  before_filter :require_no_user!, only: [:new]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      @user.reset_session_token!
      self.current_user = @user
      
      redirect_to athletes_url
    else
      flash[:errors] = "Invalid username/password!"
      redirect_to new_session_url
    end
  end
  
  def destroy
    self.logout_current_user!
    redirect_to root_path
  end

end
