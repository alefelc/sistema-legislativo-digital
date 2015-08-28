class DeclaracionsController < ApplicationController

  def index
    @declaracion = Declaracion.new
    respond_to do |format|
      format.html
      format.json { render json: DeclaracionDatatable.new(view_context) }
    end
  end

  def search_exp
      expedientes = Expediente.where(nro_exp: params[:q])
      
      render json: expedientes
  end

  def search_norma
      render json: [{name: "roli"}]
  end  

end
