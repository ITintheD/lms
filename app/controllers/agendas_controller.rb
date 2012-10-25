class AgendasController < ApplicationController
  # GET /agendas
  # GET /agendas.json
  def index
    @featured = Agenda.current_featured
    if @featured
      @agendas = Agenda.where('id <> ?', @featured.id).order('created_at DESC')
    else
      @agendas = Agenda.order('created_at DESC')
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agendas }
    end
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
    @agenda = Agenda.find(params[:id])
    @agenda.mark_as_read! :for => current_user if current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agenda }
    end
  end

end
