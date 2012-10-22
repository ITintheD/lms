class AdminController < ApplicationController
	layout 'admin'
	
	before_filter :check_access
	
	def check_access
		unless current_instructor
			redirect_to root_path
		end
	end
end
