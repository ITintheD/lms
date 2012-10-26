module Admin
	class AnnouncementsController < AdminController
	  # GET /announcements
	  # GET /announcements.json
	  def index
		@announcements = Announcement.order("created_at DESC")

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @announcements }
		end
	  end

	  # GET /announcements/1
	  # GET /announcements/1.json
	  def show
		@announcement = Announcement.find(params[:id])

		respond_to do |format|
		  format.html # show.html.erb
		  format.json { render json: @announcement }
		end
	  end

	  # GET /announcements/new
	  # GET /announcements/new.json
	  def new
		@announcement = Announcement.new

		respond_to do |format|
		  format.html # new.html.erb
		  format.json { render json: @announcement }
		end
	  end

	  # GET /announcements/1/edit
	  def edit
		@announcement = Announcement.find(params[:id])
	  end

	  # POST /announcements
	  # POST /announcements.json
	  def create
		@announcement = Announcement.create(params[:announcement])
		@announcement.instructor = current_instructor if current_instructor
		respond_to do |format|
		  if @announcement.save
  		  send_mail(APP_CONFIG["test_email"], "Announcement: #{@announcement.title}", "#{@announcement.body}") if params[:mail][:flag] 
  			format.html { redirect_to admin_announcements_path, notice: 'Announcement was successfully created.' }
  			format.json { render json: @announcement, status: :created, location: @announcement }
		  else
  			format.html { render action: "new" }
  			format.json { render json: @announcement.errors, status: :unprocessable_entity }
		  end
		end
	  end

	  # PUT /announcements/1
	  # PUT /announcements/1.json
	  def update
		@announcement = Announcement.find(params[:id])

		respond_to do |format|
		  if @announcement.update_attributes(params[:announcement])
  		  send_mail(APP_CONFIG["test_email"], "Announcement: #{@announcement.title}", "#{@announcement.body}") if params[:mail][:flag] 
  			format.html { redirect_to admin_announcements_path, notice: 'Announcement was successfully updated.' }
  			format.json { head :no_content }
		  else
  			format.html { render action: "edit" }
  			format.json { render json: @announcement.errors, status: :unprocessable_entity }
		  end
		end
	  end

	  # DELETE /announcements/1
	  # DELETE /announcements/1.json
	  def destroy
		@announcement = Announcement.find(params[:id])
		@announcement.destroy

		respond_to do |format|
		  format.html { redirect_to admin_announcements_path }
		  format.json { head :no_content }
		end
	  end
	  
	  protected
	  
	  def send_mail(email, subject, body)
	    GroupMailer.custom_email(email, subject, body).deliver
    end
    
	end
end
