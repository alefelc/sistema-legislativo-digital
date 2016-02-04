class NormasController < ApplicationController
  # before_action :authenticate_usuario!

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: NormaDatatable.new(view_context) }
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

  def norma_params
    params.require(:norma).permit("letra", "nro", "bis", "descripcion",
          "sumario", "sancion", "observaciones", "entrada_vigencia", "finaliza_vigencia",
          "plazo_dia", "plazo_mes", "plazo_anio", "organismo_origen")
  end

end
