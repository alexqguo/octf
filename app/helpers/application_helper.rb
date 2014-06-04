module ApplicationHelper
  
  def auth_token
    "<input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{form_authenticity_token}\">".html_safe
  end

  def is_admin?
  	current_user && current_user.admin?
  end
  
end
