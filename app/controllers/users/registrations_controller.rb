class Users::RegistrationsController < Devise::RegistrationsController
  
  skip_before_filter :check_access
  
end