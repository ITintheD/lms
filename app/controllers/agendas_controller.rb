class AgendasController < ApplicationController
  # GET /agendas
  # GET /agendas.json
  
  skip_before_filter :check_access
  
  def index
    @featured = Agenda.current_featured
    if @featured
      @agendas = Agenda.where('id <> ?', @featured.id).page(params[:page]).per_page(5).order('created_at DESC')
    else
      @agendas = Agenda.page(params[:page]).per_page(5).order('created_at DESC')
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
