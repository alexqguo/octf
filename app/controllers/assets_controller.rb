class AssetsController < ApplicationController
  
  before_filter :require_current_user!, except: :admin
  before_filter :require_no_user!, only: :admin
  
  def records
  end
  
  def about
  end
  
  def admin
  end

end
