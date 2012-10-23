class AgendasController < ApplicationController
  # GET /agendas
  # GET /agendas.json
  def index
    @agendas = Agenda.order('created_at DESC')
    @featured = Agenda.current_featured
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

end
