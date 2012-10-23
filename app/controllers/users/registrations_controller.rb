class Users::RegistrationsController < Devise::RegistrationsController
  
  skip_before_filter :check_access, :except => :create_photo
  
  def create_photo
	  @user = User.find(params[:id]) 	
	  respond_to do |format|
		if @user.update_without_password(params[:user])
		  format.html { redirect_to @user, notice: 'Photo was successfully created.' }
		  format.json { render :json => {:url => @user.photo.thumb.url, :location => "user_avatar"}}
		else
		  format.html { render action: "new" }
		  format.json { render json: @instructor.errors, status: :unprocessable_entity }
		end
	  end
	end
	
end