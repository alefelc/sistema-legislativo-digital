class DeclaracionsController < ApplicationController

  def index
    @declaracion = Declaracion.new
    respond_to do |format|
      format.html
      format.json { render json: DeclaracionDatatable.new(view_context) }
    end
  end

  def search_exp
      expedientes = Expediente.where("CONCAT(EXTRACT(year from anio), nro_exp, bis) ilike ?",
                                     "%#{params[:q]}%").first(10)
      render json: build_json(expedientes)
  end

  def search_norma
      render json: [{name: "roli"}]
  end

  private
  def build_json exps
    json_array = []
    exps.each do |x|
      json_array << {
        id: x.id,
        indice: x.anio.year.to_s + "/" + x.nro_exp + "/" + x.bis.to_s
      }
    end
    json_array
  end

end
