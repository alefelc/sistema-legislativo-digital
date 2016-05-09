class CondonacionsController < ApplicationController
  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: CondonacionDatatable.new(view_context) }
    end
  end

  def new
    @condonacion = Condonacion.new
    render layout: false
  end

  def show
    @condonacion = Condonacion.find params[:id]
  end

  def edit
    @condonacion = Condonacion.find params[:id]
    @process_id = params[:id]
    @administrative_files = []
    render layout: false
  end

  def destroy
    Condonacion.find(params[:id]).delete
    render json: { url: '/condonacions' }
  end

  def create
    cond = params[:condonacion].select { |key, value| ["nro_fojas", "asunto", "updated_at", "observaciones"].include?(key) }
    @condonacion = Condonacion.create cond.to_hash

    ## get params iniciadores the POST
    unless params[:iniciadores].blank?
      JSON.parse(params['iniciadores']).each do |key, value|
        @condonacion.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        @condonacion.reparticion_oficials << ReparticionOficial.where(id: value["id"]) if ((value["type"] == "ReparticionOficial"))
        ##@condonacion.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        ##@condonacion.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
      end
    end

    ## add state initial
    @condonacion.estado_tramites.create do |e|
      e.nombre = "Iniciado"
      e.tipo = 1
    end

    ## get params states the POST and save
    unless params[:states].blank?
      JSON.parse(params['states']).each do |key, value|
        @condonacion.estado_tramites.create do |e|
          e.nombre = "Derivado"
          e.tipo = 2
          e.ref_id = value["idref"]
          e.ref_type = value["typeref"]
        end
      end
    end

    ## add final state
    unless params[:finalizado].blank?
      @condonacion.estado_tramites.create do |e|
        e.nombre = "Finalizado"
        e.especificacion = params[:finalizado]
        e.tipo = 4
      end
    end

    unless params[:expediente_administrativo].blank?
      @condonacion.expediente_administrativos.create do |e|
        e.nro_exp = params[:expediente_administrativo]
        e.nro_fojas = params[:fojas_exp_adm]
      end
    end

    redirect_to action: :index
  end

  def update
    cond = params[:condonacion].select { |key, value| ["nro_fojas", "updated_at", "asunto","observaciones"].include?(key) }
    @condonacion = Condonacion.find(params[:id])
    @condonacion.update cond.to_hash

    if params['iniciadores'].present?
      ## update params iniciadores the PATCH
      current_iniciadores_personas = []
      current_iniciadores_repartciones = []
      ##current_iniciadores_bloques = []
      ##current_iniciadores_comisions = []
      old_iniciadores_personas = @condonacion.personas.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_personas.include?(value["id"])
          @condonacion.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        end
        current_iniciadores_personas << value["id"]
      end

      old_iniciadores_reparticiones = @condonacion.reparticion_oficials.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_reparticiones.include?(value["id"])
          @condonacion.reparticion_oficials << ReparticionOficial.where(id: value["id"]) if ((value["type"] == "ReparticionOficial"))
        end
        current_iniciadores_repartciones << value["id"]
      end

      ##old_iniciadores_bloques = @condonacion.bloques.map{ |x| x.id }
      ##JSON.parse(params['iniciadores']).each do |key, value|
      ##  unless old_iniciadores_bloques.include?(value["id"])
      ##    @condonacion.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
      ##  end
      ##  current_iniciadores_bloques << value["id"]
      ##end

      ##old_iniciadores_comisions = @condonacion.comisions.map{ |x| x.id }
      ##JSON.parse(params['iniciadores']).each do |key, value|
      ##  unless old_iniciadores_comisions.include?(value["id"])
      ##    @condonacion.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
      ##  end
      ##  current_iniciadores_comisions << value["id"]
      ##end

      # delete iniciadores
      (old_iniciadores_personas - current_iniciadores_personas).each { |id| @condonacion.personas.delete(id) }
      (old_iniciadores_reparticiones - current_iniciadores_repartciones).each { |id| @condonacion.reparticion_oficials.delete(id) }
      ##(old_iniciadores_bloques - current_iniciadores_bloques).each { |id| @condonacion.bloques.delete(id) }
      ##(old_iniciadores_comisions - current_iniciadores_comisions).each { |id| @condonacion.comisions.delete(id) }
    end

    ## update params states the PATCH
    if params['states'].present?
      current_states = []
      old_states = @condonacion.estado_tramites.where(tipo: 2).map{ |x| x.id }
      JSON.parse(params['states']).each do |key, value|
        unless old_states.include?(value["id"])
          @condonacion.estado_tramites.create do |e|
            e.nombre = "Derivado"
            e.tipo = 2
            e.ref_id = value["idref"]
            e.ref_type = value["typeref"]
          end
        end
        current_states << value["id"]
      end
      # delete states
      (old_states - current_states).each { |id| @condonacion.estado_tramites.delete(id) }
    end

    ## update final state
    finalizado = params[:finalizado]
    unless finalizado.blank?
      estado = @condonacion.estado_tramites.find_by(tipo: "4")
      if estado.present?
        estado.update especificacion: params[:finalizado]
      else
        @condonacion.estado_tramites.create do |e|
          e.nombre = "Finalizado"
          e.especificacion = params[:finalizado]
          e.tipo = 4
        end
      end
    end

    unless params[:expediente_administrativo].blank?
      exp = {
        nro_exp: params[:expediente_administrativo],
        nro_fojas: params[:fojas_exp_adm]
      }
      if @condonacion.expediente_administrativos.present?
        @condonacion.expediente_administrativos.first.update_attributes exp
      else
        @condonacion.expediente_administrativos.create exp
      end
    end

    redirect_to action: :index
  end

  def get_iniciador
    ##com = Comision.where("denominacion ilike ?",
    ##                               "%#{params[:q]}%").first(7)
    ##bloques = Bloque.where("denominacion ilike ?",
    ##                               "%#{params[:q]}%").first(7)
    repart = ReparticionOficial.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    per = Persona.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
                                   "%#{params[:q]}%").where.not(type: "Concejal").order(apellido: :asc).first(7)
    ##com = com.as_json(methods: 'type')
    ##bloques = bloques.as_json(methods: 'type')
    repart = repart.as_json(methods: 'type')
    per = per.as_json(methods: 'type' )
    q = per + repart ##com + bloques
    agregar_nuevo = {"id"=>nil, "nombre"=>"", "apellido"=>"Agregar Nuevo", "tipo_doc"=>nil, "nro_doc"=>"", "telefono"=>"", "email"=>"", "domicilio"=>"", "denominacion"=>"", "cargo"=>nil, "bloque_id"=>nil, "created_at"=>nil, "updated_at"=>nil, "cuit"=>0, "type"=>""}
    iniciadores = q.push(agregar_nuevo);
    render json: iniciadores
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

  private

  def condonacion_params
    params.require(:condonacion).permit("nro_fojas", "asunto", "updated_at",  "observaciones")
  end

end
