class Instructors::SessionsController < Devise::SessionsController
  
  skip_before_filter :check_access
  
end