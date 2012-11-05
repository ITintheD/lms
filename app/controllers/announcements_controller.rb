class AnnouncementsController < ApplicationController
  # GET /announcements
  # GET /announcements.json
  def index
    @featured = Announcement.current_featured
    if @featured
      @announcements = Announcement.where('id <> ?', @featured.id).page(params[:page]).per_page(5).order('created_at DESC')
    else
      @announcements = Announcement.page(params[:page]).per_page(5).order('created_at DESC')
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
