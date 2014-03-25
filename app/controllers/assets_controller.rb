class AssetsController < ApplicationController
  
  before_filter :require_current_user!, except: :admin
  before_filter :require_no_user!, only: :admin
  
  def records
  end
  
  def home
  end
  
  def admin
  end

  def send_email
  	from = params[:email][:from]
  	subject = params[:email][:subject]
  	body = params[:email][:body]

  	email = ApplicationMailer.admin_email(from, subject, body)
  	email.deliver!

    flash[:notice] = "Email successfully delivered."

  	redirect_to home_url
  end

end