module Admin
	class AgendasController < AdminController
	  # GET /agendas
	  # GET /agendas.json
	  	  
	  def index
		@agendas = Agenda.order("created_at DESC")

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @agendas }
		end
	  end

	  # GET /agendas/1
	  # GET /agendas/1.json
	  def show
		@agenda = Agenda.find(params[:id])

		respond_to do |format|
		  format.html # show.html.erb
		  format.json { render json: @agenda }
		end
	  end

	  # GET /agendas/new
	  # GET /agendas/new.json
	  def new
		@agenda = Agenda.new

		respond_to do |format|
		  format.html # new.html.erb
		  format.json { render json: @agenda }
		end
	  end

	  # GET /agendas/1/edit
	  def edit
		@agenda = Agenda.find(params[:id])
	  end

	  # POST /agendas
	  # POST /agendas.json
	  def create
		@agenda = Agenda.new(params[:agenda])
		@agenda.instructor = current_instructor if current_instructor
		respond_to do |format|
		  if @agenda.save
		  send_mail(APP_CONFIG["group_email"], "#{@agenda.week.title} Agenda: #{@agenda.title}", "#{@agenda.body}") if (params[:mail][:flag] == "1")
			format.html { redirect_to admin_agendas_path, notice: 'Agenda was successfully created.' }
			format.json { render json: @agenda, status: :created, location: @agenda }
		  else
			format.html { render action: "new" }
			format.json { render json: @agenda.errors, status: :unprocessable_entity }
		  end
		end
	  end

	  # PUT /agendas/1
	  # PUT /agendas/1.json
	  def update
		@agenda = Agenda.find(params[:id])

		respond_to do |format|
		  if @agenda.update_attributes(params[:agenda])
		  send_mail(APP_CONFIG["group_email"], "#{@agenda.week.title} Agenda: #{@agenda.title}", "#{@agenda.body}") if (params[:mail][:flag] == "1") 
			format.html { redirect_to admin_agendas_path, notice: 'Agenda was successfully updated.' }
			format.json { head :no_content }
		  else
			format.html { render action: "edit" }
			format.json { render json: @agenda.errors, status: :unprocessable_entity }
		  end
		end
	  end

	  # DELETE /agendas/1
	  # DELETE /agendas/1.json
	  def destroy
		@agenda = Agenda.find(params[:id])
		@agenda.destroy

		respond_to do |format|
		  format.html { redirect_to admin_agendas_path }
		  format.json { head :no_content }
		end
	  end
	  
	  protected
	  
	  def send_mail(email, subject, body)
	    GroupMailer.custom_email(email, subject, body).deliver
    end
	end
end
