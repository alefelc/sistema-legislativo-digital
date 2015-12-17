class TramitesController < ApplicationController
  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: TramiteDatatable.new(view_context) }
    end
  end

  def new
    
  end

  def show
    
  end

  def edit
    
  end

  def destroy
    
  end

  def create
    
  end

  def update
    
  end

  private

  def tramite_params
    params.require(:tramite).permit("nro_fojas", "asunto", "fecha", "pendiente", "updated_at",  "observaciones")
  end

end
