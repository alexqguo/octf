class AssetsController < ApplicationController
  
  before_filter :require_no_user!, only: :admin
  
  def records
    @men_indoor = Record.men_indoor
    @men_outdoor = Record.men_outdoor
    @women_indoor = Record.women_indoor
    @women_outdoor = Record.women_outdoor
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