class DespachosController < ApplicationController
  before_action :authenticate_user!, { except: [ :show, :index ] }

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: DespachoDatatable.new(view_context) }
    end
  end

  def new
    @despacho = Despacho.new
    @upload = Upload.new
    render layout: false
  end

  def show
    @despacho = Despacho.find(params[:id])
  end

  def edit
    @despacho = Despacho.find(params[:id])
    @upload = Upload.new
    render layout: false
  end

  def destroy
    Despacho.find(params[:id]).delete
    render json: { url: '/despachos' }
  end

  def create
    desp = params[:despacho].select do |key, value|
      %w(nro_fojas fecha observaciones day month year).include?(key)
    end

    @despacho = Despacho.create desp.to_hash

    # Upload files
    if params[:despacho][:upload].present?
      params[:despacho][:upload][:file].each do |file|
        upload = @despacho.uploads.build
        upload.file = file
        upload.save
      end
    end

    ## get params comisions the POST
    comisions = params[:despacho][:comisions]
    ## remuevo el primer elemento porq viene uno vacio siempre "", sino resolver desde el coffee los parametros q se envian
    comisions.delete_at(0) unless comisions.empty?
    unless comisions.blank?
      @despacho.comisions << Comision.where(id: comisions)
    end

    ## get params concejals the POST
    concejals = params[:despacho][:concejals]
    unless concejals.blank?
      @despacho.concejals << Concejal.where(id: concejals)
    end

    ## get params circuitos the POST
    unless params[:circuitos].blank?
      JSON.parse(params[:circuitos]).each do |key, value|
        id = value["id"]
        array_c = value["circ"]
        expediente = Expediente.find(id)
        if array_c.empty?
          ## no se sancionan circuitos sino solamente el expediente osea el circuito 0
          circuito_zero = expediente.circuitos.find_by(nro: 0)
          @despacho.circuitos << circuito_zero
          comisions.each do |c|
            esp1 = Comision.find_by(id: c).denominacion.to_s
            circuito_zero.estado_expedientes.create do |ne|
              ne.nombre = "Dictaminado"
              ne.tipo = "9"
              ne.fecha = params[:despacho][:fecha]
              ne.especificacion1 = esp1
              ne.especificacion2 = params[:especificacion2]
              ne.ref_id = @despacho.id
              ne.ref_type = @despacho.type
            end
          end
        else
          ## la dictaminacion recaer sobre algun circuito
          array_c.each do |nro_c|
            circuito = expediente.circuitos.find_by(nro: nro_c)
            @despacho.circuitos << circuito
            comisions.each do |c|
              esp1 = Comision.find_by(id: c).denominacion.to_s
              circuito.estado_expedientes.create do |ne|
                ne.nombre = "Dictaminado"
                ne.tipo = "9"
                ne.fecha = params[:despacho][:fecha]
                ne.especificacion1 = esp1
                ne.especificacion2 = params[:especificacion2]
                ne.ref_id = @despacho.id
                ne.ref_type = @despacho.type
              end
            end
          end
        end
      end
    end

    ## add state initial
    @despacho.estado_tramites.create do |e|
      e.nombre = "Iniciado"
      e.tipo = 1
    end

    ## get params states the POST and save
    unless params[:states].blank?
      JSON.parse(params['states']).each do |key, value|
        @despacho.estado_tramites.create do |e|
          e.nombre = "Derivado"
          e.tipo = 2
          e.ref_id = value["idref"]
          e.ref_type = value["typeref"]
        end
      end
    end

    redirect_to action: :index
  end

  def update
    desp = params[:despacho].select do |key, value|
      ["nro_fojas", "fecha","observaciones", "day", "month", "year"].include?(key)
    end
    @despacho = Despacho.find(params[:id])

    if params[:despacho][:upload].present?
      params[:despacho][:upload][:file].each do |file|
        upload = @despacho.uploads.build
        upload.file = file
        upload.save
      end
    end

    @despacho.update desp.to_hash

    ## update params comisions the PATCH
    current_comisions = params[:despacho][:comisions]
    ## remuevo el primer elemento porq viene uno vacio siempre "",
    ## sino resolver desde el coffee los parametros q se envian
    current_comisions.delete_at(0) unless current_comisions.empty?
    old_comisions = @despacho.comisions.map{ |x| x.id.to_s}
    associated_comisions = (current_comisions - old_comisions)
    @despacho.comisions << Comision.where(id: associated_comisions)
    clear_comisions = (old_comisions - current_comisions)
    @despacho.comisions.delete(Comision.where(id: clear_comisions))

    ## update params concejals the PATCH
    current_concejals = params[:despacho][:concejals]
    old_concejals = @despacho.concejals.map{ |x| x.id.to_s}
    associated_concejals = (current_concejals - old_concejals)
    @despacho.concejals << Concejal.where(id: associated_concejals)
    clear_concejals = (old_concejals - current_concejals)
    @despacho.concejals.delete(Concejal.where(id: clear_concejals))

    ## update params circuitos the PATCH
    @despacho.circuitos.each do |c|
      c.estado_expedientes.where(tipo: "9", ref_id: @despacho.id).delete_all
    end
    @despacho.circuitos.delete_all
    JSON.parse(params[:circuitos]).each do |key, value|
      id = value["id"]
      array_c = value["circ"]
      expediente = Expediente.find(id)
      if array_c.empty?
        ## no se sancionan circuitos sino solamente el expediente osea el circuito 0
        circuito_zero = expediente.circuitos.find_by(nro: 0)
        @despacho.circuitos << circuito_zero
        current_comisions.each do |c|
          esp1 = Comision.find_by(id: c).denominacion.to_s
          circuito_zero.estado_expedientes.create do |ne|
            ne.nombre = "Dictaminado"
            ne.tipo = "9"
            ne.fecha = params[:despacho][:fecha]
            ne.especificacion1 = esp1
            ne.especificacion2 = params[:especificacion2]
            ne.ref_id = @despacho.id
            ne.ref_type = @despacho.type
          end
        end
      else
        ## la sancion recaer sobre algun circuito
        array_c.each do |nro_c|
          circuito = expediente.circuitos.find_by(nro: nro_c)
          @despacho.circuitos << circuito
          current_comisions.each do |c|
            esp1 = Comision.find_by(id: c).denominacion.to_s
            circuito.estado_expedientes.create do |ne|
              ne.nombre = "Dictaminado"
              ne.tipo = "9"
              ne.fecha = params[:despacho][:fecha]
              ne.especificacion1 = esp1
              ne.especificacion2 = params[:especificacion2]
              ne.ref_id = @despacho.id
              ne.ref_type = @despacho.type
            end
          end
        end
      end
    end

    ## update params states the PATCH
    if params['states'].present?
      current_states = []
      old_states = @despacho.estado_tramites.where(tipo: 2).map{ |x| x.id }
      JSON.parse(params['states']).each do |key, value|
        unless old_states.include?(value["id"])
          @despacho.estado_tramites.create do |e|
            e.nombre = "Derivado"
            e.tipo = 2
            e.ref_id = value["idref"]
            e.ref_type = value["typeref"]
          end
        end
        current_states << value["id"]
      end
      # delete states
      (old_states - current_states).each { |id| @despacho.estado_tramites.delete(id) }
    end

    redirect_to action: :index
  end

  def search_exp
    expedientes = Expediente.where("CONCAT(nro_exp, bis, EXTRACT(year from anio)) ilike ?",
                                   "%#{params[:q]}%").order("nro_exp::int asc").first(15)
    render json: build_json_exp(expedientes)
  end

  def get_derivacion
    areas = Area.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(10)
    com = Comision.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    bloques = Bloque.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    personal = Personal.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
                                   "%#{params[:q]}%").order(apellido: :asc).first(7)
    areas = areas.as_json(methods: 'type')
    com = com.as_json(methods: 'type')
    bloques = bloques.as_json(methods: 'type')
    personal = personal.as_json(methods: 'type' )
    q = areas + com + bloques + personal
    render json: q
  end

  def destroy_uploads
    @upload = Upload.find(params[:upload])
    if @upload.delete
      render json:  { success: :ok }
    else
      render json: @upload.errors
    end
  end

  private

  def despacho_params
    params.require(:despacho).permit(:nro_fojas, :fecha, :observaciones, :day,
                                     :month, :year, upload: [:file])
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

end
