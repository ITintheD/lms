class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  def index
    @featured_resources = Resource.where(:featured => true).order("created_at DESC")   
    unless @featured_resources.blank?  
    	@resources = Resource.where('id <> ?', @featured_resources.collect(&:id)).page(params[:page]).per_page(5).order("created_at DESC")  
    else
    	@resources = Resource.page(params[:page]).per_page(5).order("created_at DESC")
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(params[:resource])
    if current_user
      @resource.resourceable_type = current_user.class.name
      @resource.resourceable_id = current_user.id
    else
      @resource.resourceable_type = current_instructor.class.name
      @resource.resourceable_id = current_instructor.id
    end
    
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
  
  def read
    @resource = Resource.find(params[:id])    
    @resource.mark_as_read! :for => current_user if current_user
    render :nothing => true
  end
  
end
