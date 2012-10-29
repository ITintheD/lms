class AnnouncementsController < ApplicationController
  # GET /announcements
  # GET /announcements.json
  def index
    @featured = Announcement.current_featured
    if @featured
      @announcements = Announcement.where('id <> ?', @featured.id).order('created_at DESC').page(params[:page]).per_page(10)
    else
      @announcements = Announcement.order('created_at DESC').page(params[:page]).per_page(10)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @announcement = Announcement.find(params[:id])
    @announcement.mark_as_read! :for => current_user if current_user
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end


end
