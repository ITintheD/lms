class InstructorsController < ApplicationController
  # GET /instructors
  # GET /instructors.json
  
  skip_before_filter :check_access, :except => :create_photo
  
  def index
    @instructors = Instructor.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @instructors }
    end
  end

  # GET /instructors/1
  # GET /Instructors/1.json
  def show
    @instructor = Instructor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @instructor }
    end
  end


end