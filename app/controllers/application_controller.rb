class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_access, :except => [:about]
  
  def check_access
    unless current_user || current_instructor
      redirect_to about_page_path
    end
  end
  
end
