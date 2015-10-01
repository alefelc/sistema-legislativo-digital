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

  def show
    @declaracion = Declaracion.find(params[:id])
  end  
  
  def edit
    @declaracion = Declaracion.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_declaration", locals: { actionvar: "update"}}
    end
  end

  def create
    decl = params[:declaracion].select { |key, value| ["letra", "nro", "bis", "descripcion",
          "sumario", "sancion", "observaciones", "entrada_vigencia", "finaliza_vigencia",
          "plazo_dia", "plazo_mes", "plazo_anio", "organismo_origen"].include?(key) }
    @declaracion = Declaracion.create decl.to_hash
    ## get params tags_ids the POST
    unless params[:tags_ids].blank?
      params[:tags_ids].split(',').each do |id|
        @declaracion.tags << Tag.find(id)
      end
    end
    ## get params exps_ids the POST
    unless params[:exps_ids].blank?
      params[:exps_ids].split(',').each do |id|
        exp = Expediente.find(id)
        @declaracion.circuitos << exp.circuitos.find_by(nro: 0)
      end
    end
    ## get params clasifications_ids the POST and save
    unless params[:clasificaciones].blank?
      params[:clasificaciones].each do |key,value|
        @declaracion.clasificacions <<  Clasificacion.where(nombre: key).first()
      end
    end
    ## get params notif and comunic the POST and save
    if params[:declaracion]['com_date'].present?
      com_date = params[:declaracion]['com_date']
      com_dest = params[:declaracion]['com_dest']
      dest = Destino.create tipo: 0, fecha: com_date, destino: com_dest
      @declaracion.destinos << dest
    end
    if params[:declaracion]['not_date'].present?
      not_date = params[:declaracion]['not_date']
      not_dest = params[:declaracion]['not_dest']
      dest = Destino.create tipo: 1, fecha: not_date, destino: not_dest
      @declaracion.destinos << dest
    end
    ## get params linked_normas the POST and save
    if params['linked_normas'].present?
      JSON.parse(params['linked_normas']).each do |key, value|
        @declaracion.relationship_modificadas.create do |rm|
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

    redirect_to action: :index
  end

  def update
    @declaracion = Declaracion.find(params[:id])
    decl = params[:declaracion].select { |key, value| ["letra", "nro", "bis", "descripcion",
          "sumario", "sancion", "observaciones", "entrada_vigencia", "finaliza_vigencia",
          "plazo_dia", "plazo_mes", "plazo_anio", "organismo_origen"].include?(key) }

    @declaracion.update decl.to_hash

    ## update params tags_ids the PATCH
    current_tags = params[:tags_ids].split(',')
    old_tag = @declaracion.tags.map{ |x| x.id.to_s }
    (current_tags - old_tag).each do |id|
      @declaracion.tags << Tag.find(id)
    end
    (old_tag - current_tags).each do |id|
      @declaracion.tags.delete(id)
    end

    ## update params exps_ids the PATCH
    current_exps = params[:exps_ids].split(',')
    old_exps = @declaracion.expedientes.map{ |x| x.id.to_s}
    (current_exps - old_exps).each do |id|
      exp = Expediente.find(id)
      @declaracion.circuitos << exp.circuitos.find_by(nro: 0)
    end
    (old_exps - current_exps).each do |id|
      id_circuito = Expediente.find(id).circuitos.find_by(nro: 0).id
      @declaracion.circuitos.delete(id_circuito)
    end

    ## update params clasifications_ids the PATCH    
    current_clasific = []
    old_clasific = @declaracion.clasificacions.map{ |x| x.id}
    
    unless params[:clasificaciones].blank?
      params[:clasificaciones].each do |key,value|
        current_clasific << Clasificacion.where(nombre: key).first().id
      end
    end
    (current_clasific - old_clasific).each do |id|
      @declaracion.clasificacions <<  Clasificacion.find(id)
    end
    (old_clasific - current_clasific).each do |id|
      @declaracion.clasificacions.delete(id)
    end

    ## update params linked_normas the PATCH
    current_normas = []
    old_normas = @declaracion.modificadas.map{ |x| x.id}
    if params['linked_normas'].present?
      JSON.parse(params['linked_normas']).each do |key, value|
        unless old_normas.include?(value["id"])
          @declaracion.relationship_modificadas.create do |rm|
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
    end
    puts "current_normas #{current_normas}"
    puts "old_normas #{old_normas}"
    # delete norms
    (old_normas - current_normas).each do |id|
      @declaracion.modificadas.delete(id)
    end

    redirect_to action: :index
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

  def declaracion_params
    params.require(:declaracion).permit("letra", "nro", "bis", "descripcion",
          "sumario", "sancion", "observaciones", "entrada_vigencia", "finaliza_vigencia",
          "plazo_dia", "plazo_mes", "plazo_anio", "organismo_origen")
  end

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
