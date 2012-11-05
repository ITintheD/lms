class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_access, :except => [:about]
  
  def check_access
    unless current_user || current_instructor
      redirect_to new_user_session_path
    end
  end
  
end
