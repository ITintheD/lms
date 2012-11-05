class AdminController < ApplicationController
	layout 'admin'
	
	before_filter :check_access
	
	def check_access
		unless current_instructor
			redirect_to new_instructor_session_path
		end
	end
end
