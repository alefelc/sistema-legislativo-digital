class DeclaracionsController < ApplicationController
  respond_to :json, :html

  def index
    @declaracion = Declaracion.new
    respond_to do |format|
      format.html
      format.json { render json: DeclaracionDatatable.new(view_context) }
    end
  end

  def new
    @declaracion = Declaracion.new
    respond_to do |format|
      format.html {render partial: "modal_declaration", locals: { actionvar: "create"}}
    end
  end

  def edit
    @declaracion = Declaracion.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_declaration", locals: { actionvar: "update"}}
    end
  end

  def search_exp
    expedientes = Expediente.where("CONCAT(EXTRACT(year from anio), nro_exp, bis) ilike ?",
                                   "%#{params[:q]}%").first(10)
    render json: build_json_exp(expedientes)
  end

  def search_norma
    normas = Norma.where("CONCAT(EXTRACT(year from sancion), nro, bis) ilike ?",
                                   "%#{params[:q]}%").first(10)
    render json: build_json_norma(normas)
  end

  def search_tag
    tags = Tag.where("nombre ilike '%#{params[:q]}%'").first(5)
    render json: tags
  end

  private

  def build_json_exp exps
    json_array = []
    exps.each do |x|
      year = x.anio.present? ? x.anio.year.to_s : ""
      json_array << {
        id: x.id,
        indice: year + "/" + x.nro_exp + "/" + x.bis.to_s
      }
    end
    json_array
  end

  def build_json_norma norma
    json_array = []
    norma.each do |x|
      year = x.sancion.present? ? x.sancion.year.to_s : ""
      json_array << {
        id: x.id,
        indice: x.type + ": " + year + "/" + x.nro.to_s + "/" + x.bis.to_s
      }
    end
    json_array
  end

end
