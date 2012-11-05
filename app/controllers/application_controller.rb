class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_access, :except => [:home]
  
  def check_access
    unless current_user || current_instructor
      redirect_to new_user_session_path
    end
  end
  
  def after_sign_in_path_for(resource)
   announcements_path
  end
  
end
