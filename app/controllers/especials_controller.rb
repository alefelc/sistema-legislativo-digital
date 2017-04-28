class EspecialsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json, :html

  def index
    @especial = Especial.new
    respond_to do |format|
      format.html
      format.json { render json: EspecialDatatable.new(view_context) }
    end
  end

  def new
    @especial = Especial.new
    respond_to do |format|
      format.html {render partial: "modal_especial", locals: { actionvar: "create"}}
    end
  end

  def show
    @especial = Especial.find(params[:id])
  end

  def edit
    @especial = Especial.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_especial", locals: { actionvar: "update"}}
    end
  end

  def destroy
    Especial.find(params[:id]).delete
    render json: {url: "/especials"}
  end

  def create
    esp = params[:especial].select { |key, value| ["letra", "nro", "bis", "descripcion",
          "sumario", "sancion", "observaciones", "entrada_vigencia", "finaliza_vigencia",
          "plazo_dia", "plazo_mes", "plazo_anio", "organismo_origen"].include?(key) }
    @especial = Especial.create esp.to_hash

    ## get params tags_ids the POST
    params[:tags_ids].split(',').each { |id| @especial.tags << Tag.find(id) } unless params[:tags_ids].blank?

    ## get params circuitos the POST
    unless params[:circuitos].blank?
      JSON.parse(params[:circuitos]).each do |key, value|
        id = value["id"]
        array_c = value["circ"]
        expediente = Expediente.find(id)
        if array_c.empty?
          ## no se sancionan circuitos sino solamente el expediente osea el circuito 0
          circuito_zero = expediente.circuitos.find_by(nro: 0)
          @especial.circuitos << circuito_zero
          circuito_zero.estado_expedientes.create do |ne|
            ne.nombre = "Sancionado"
            ne.tipo = "8"
            ne.fecha = params[:especial][:sancion]
            ne.especificacion1 = params[:especificacion1]
            ne.especificacion2 = params[:especificacion2]
            ne.ref_id = @especial.id
            ne.ref_type = @especial.type
          end
        else
          ## la sancion recaer sobre algun circuito
          array_c.each do |nro_c|
            circuito = expediente.circuitos.find_by(nro: nro_c)
            @especial.circuitos << circuito
            circuito.estado_expedientes.create do |ne|
              ne.nombre = "Sancionado"
              ne.tipo = "8"
              ne.fecha = params[:especial][:sancion]
              ne.especificacion1 = params[:especificacion1]
              ne.especificacion2 = params[:especificacion2]
              ne.ref_id = @especial.id
              ne.ref_type = @especial.type
            end
          end
        end
      end
    end

    ## get params clasifications_ids the POST and save
    unless params[:clasificaciones].blank?
      params[:clasificaciones].each { |key,value| @especial.clasificacions <<  Clasificacion.where(nombre: key).first() }
    end

    ## get params linked_normas the POST and save
    unless params[:linked_normas].blank?
      JSON.parse(params['linked_normas']).each do |key, value|
        @especial.relationship_modificadas.create do |rm|
          rm.tipo_relacion = value["relation_type"]
          rm.modifica_id = value["id"]
          rm.desde = value["from"]
          rm.hasta = value["to"]
          rm.dia = value["to_day"]
          rm.mes = value["to_month"]
          rm.anio = value["to_year"]
          rm.dia_habil = value["type_day"]
        end
      end
    end

    unless params[:destinies].blank?
      JSON.parse(params[:destinies]).each do |key, value|
        @especial.destinos.create do |d|
          d.tipo = value['tipo']
          d.fecha = value['fecha']
          d.destino = value['destino']
        end
      end
    end

    redirect_to action: :index
  end

  def update
    @especial = Especial.find(params[:id])
    esp = params[:especial].select { |key, value| ["letra", "nro", "bis", "descripcion",
          "sumario", "sancion", "observaciones", "entrada_vigencia", "finaliza_vigencia",
          "plazo_dia", "plazo_mes", "plazo_anio", "organismo_origen"].include?(key) }

    @especial.update esp.to_hash

    ## update params tags_ids the PATCH
    current_tags = params[:tags_ids].split(',')
    old_tag = @especial.tags.map{ |x| x.id.to_s }
    (current_tags - old_tag).each { |id| @especial.tags << Tag.find(id) }
    (old_tag - current_tags).each { |id| @especial.tags.delete(id) }

    ## update params circuitos the PATCH
    @especial.circuitos.each do |c|
      c.estado_expedientes.where(tipo: "8").delete_all
    end
    @especial.circuitos.delete_all
    JSON.parse(params[:circuitos]).each do |key, value|
      id = value["id"]
      array_c = value["circ"]
      expediente = Expediente.find(id)
      if array_c.empty?
        ## no se sancionan circuitos sino solamente el expediente osea el circuito 0
        circuito_zero = expediente.circuitos.find_by(nro: 0)
        @especial.circuitos << circuito_zero
        circuito_zero.estado_expedientes.create do |ne|
          ne.nombre = "Sancionado"
          ne.tipo = "8"
          ne.fecha = params[:especial][:sancion]
          ne.especificacion1 = params[:especificacion1]
          ne.especificacion2 = params[:especificacion2]
          ne.ref_id = @especial.id
          ne.ref_type = @especial.type
        end
      else
        ## la sancion recaer sobre algun circuito
        array_c.each do |nro_c|
          circuito = expediente.circuitos.find_by(nro: nro_c)
          @especial.circuitos << circuito
          circuito.estado_expedientes.create do |ne|
            ne.nombre = "Sancionado"
            ne.tipo = "8"
            ne.fecha = params[:especial][:sancion]
            ne.especificacion1 = params[:especificacion1]
            ne.especificacion2 = params[:especificacion2]
            ne.ref_id = @especial.id
            ne.ref_type = @especial.type
          end
        end
      end
    end

    ## update params clasifications_ids the PATCH
    current_clasific = []
    old_clasific = @especial.clasificacions.map{ |x| x.id}
    if params[:clasificaciones].present?
      params[:clasificaciones].each { |key,value| current_clasific << Clasificacion.where(nombre: key).first().id }
    end
    (current_clasific - old_clasific).each { |id| @especial.clasificacions <<  Clasificacion.find(id) }
    (old_clasific - current_clasific).each { |id| @especial.clasificacions.delete(id) }

    if params['linked_normas'].present?
      ## update params linked_normas the PATCH
      current_normas = []
      old_normas = @especial.modificadas.map{ |x| x.id }
      JSON.parse(params['linked_normas']).each do |key, value|
        unless old_normas.include?(value["id"])
          @especial.relationship_modificadas.create do |rm|
              rm.tipo_relacion = value["relation_type"]
              rm.modifica_id = value["id"]
              rm.desde = value["from"]
              rm.hasta = value["to"]
              rm.dia = value["to_day"]
              rm.mes = value["to_month"]
              rm.anio = value["to_year"]
              rm.dia_habil = value["type_day"]
          end
        end
        current_normas << value["id"]
      end
      # delete norms
      (old_normas - current_normas).each { |id| @especial.modificadas.delete(id) }
    end

    current_destinies = JSON.parse(params[:destinies]).select{ |x, y| y.has_key?(:id) }.map{ |x, y| y[:id] }
    new_destinies = JSON.parse(params[:destinies]).select{ |x, y| not y.has_key?(:id) }
    old_destinies = @especial.destinos.map{ |x| x.id.to_s }
    new_destinies.each do |key, value|
      @especial.destinos.create do |nd|
        nd.tipo = value['tipo']
        nd.fecha = value['fecha']
        nd.destino = value['destino']
      end
    end
    (old_destinies - current_destinies).each { |id| @especial.destinos.delete(id) }

    redirect_to action: :index
  end

  def search_exp
    expedientes = Expediente.where("CONCAT(nro_exp, bis, EXTRACT(year from anio)) ilike ?",
                                   "%#{params[:q]}%").order("nro_exp::int asc").first(15)
    render json: build_json_exp(expedientes)
  end

  def search_norma
    normas = Norma.where("CONCAT(nro, bis, EXTRACT(year from sancion)) ilike ?",
                                   "%#{params[:q]}%").order(nro: :asc).first(15)
    render json: build_json_norma(normas)
  end

  def search_tag
    tags = Tag.where("nombre ilike '%#{params[:q]}%'").first(5)
    render json: tags
  end

  private

  def especial_params
    params.require(:especial).permit("letra", "nro", "bis", "descripcion",
          "sumario", "sancion", "observaciones", "entrada_vigencia", "finaliza_vigencia",
          "plazo_dia", "plazo_mes", "plazo_anio", "organismo_origen")
  end

  def build_json_exp exps
    json_array = []
    exps.each do |x|
      year = x.anio.present? ? x.anio.year.to_s : ""
      nro_c = x.circuitos.count - 1
      array_c = []
      json_array << {
        id: x.id,
        indice: x.nro_exp + "/" + x.bis.to_s + "/" + year,
        nro_c: nro_c,
        array_c: array_c
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
        indice: x.type + ": " + x.nro.to_s + "/" + x.bis.to_s  + "/" + year
      }
    end
    json_array
  end

end
