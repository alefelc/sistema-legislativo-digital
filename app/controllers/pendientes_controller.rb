class PendientesController < ApplicationController
  # before_action :authenticate_user!

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: PendienteDatatable.new(view_context) }
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

  def pendiente_params
    params.require(:tramite).permit("nro_fojas", "fecha", "asunto", "observaciones")
  end

end
