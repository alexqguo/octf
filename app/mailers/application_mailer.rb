class ApplicationMailer < ActionMailer::Base
  default from: "notifications@octf.alexguo.us"

  def admin_email(from, subject, body)
  	@from, @body = from, body

  	mail(to: "alexqguo@gmail.com", subject: "#{from}@OCTF.ALEXGUO.US -- #{subject}")
  end

end
