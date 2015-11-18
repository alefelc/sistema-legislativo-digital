class ComunicacionOficialsController < ApplicationController
  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: ComunicacionOficialDatatable.new(view_context) }
    end
  end

  def new
    @comunicacion_oficial = ComunicacionOficial.new
    respond_to do |format|
      format.html {render partial: "modal_comunicacion_oficial", locals: { actionvar: "create"}}
    end
  end

  def show
    @comunicacion_oficial = ComunicacionOficial.find(params[:id])
  end

  def edit
    @comunicacion_oficial = ComunicacionOficial.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_comunicacion_oficial", locals: { actionvar: "update"}}
    end
  end

  def destroy
    ComunicacionOficial.find(params[:id]).delete
    render json: {url: "/comunicacion_oficials"}
  end

  def create
    com = params[:comunicacion_oficial].select { |key, value| ["nro_fojas", "asunto", "updated_at", "observaciones"].include?(key) }
    @comunicacion_oficial = ComunicacionOficial.create com.to_hash

    ## get params iniciadores the POST
    unless params[:iniciadores].blank?
      JSON.parse(params['iniciadores']).each do |key, value|
        @comunicacion_oficial.personas << Persona.where(id: value["id"]) if ((value["type"] == "Concejal"))
        @comunicacion_oficial.reparticion_oficials << ReparticionOficial.where(id: value["id"]) if ((value["type"] == "ReparticionOficial"))
        @comunicacion_oficial.dependencia_municipals << DependenciaMunicipal.where(id: value["id"]) if ((value["type"] == "DependenciaMunicipal"))
        @comunicacion_oficial.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        @comunicacion_oficial.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
        @comunicacion_oficial.organo_de_gobiernos << OrganoDeGobierno.where(id: value["id"]) if ((value["type"] == "OrganoDeGobierno"))
        @comunicacion_oficial.areas << Area.where(id: value["id"]) if ((value["type"] == "Area"))
      end
    end

    ## add state initial
    @comunicacion_oficial.estado_tramites.create do |e|
      e.nombre = "iniciado"
      e.tipo = 1
    end

    ## get params states the POST and save
    unless params[:states].blank?
      JSON.parse(params['states']).each do |key, value|
        @comunicacion_oficial.estado_tramites.create do |e|
          e.nombre = "derivado"
          e.tipo = 2
          e.ref_id = value["idref"]
          e.ref_type = value["typeref"]
        end
      end
    end

    redirect_to action: :index
  end

  def update
    com = params[:comunicacion_oficial].select { |key, value| ["nro_fojas", "updated_at", "asunto","observaciones"].include?(key) }
    @comunicacion_oficial = ComunicacionOficial.find(params[:id])
    @comunicacion_oficial.update com.to_hash

    if params['iniciadores'].present?
      ## update params iniciadores the PATCH
      current_iniciadores_personas = []
      current_iniciadores_organos = []
      current_iniciadores_areas = []
      current_iniciadores_bloques = []
      current_iniciadores_comisions = []
      current_iniciadores_reparticiones = []
      current_iniciadores_dependencias = []
      old_iniciadores_personas = @comunicacion_oficial.personas.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_personas.include?(value["id"])
          @comunicacion_oficial.personas << Persona.where(id: value["id"]) if ((value["type"] == "Concejal"))
        end
        current_iniciadores_personas << value["id"]
      end

      old_iniciadores_organos = @comunicacion_oficial.organo_de_gobiernos.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_organos.include?(value["id"])
          @comunicacion_oficial.organo_de_gobiernos << OrganoDeGobierno.where(id: value["id"]) if ((value["type"] == "OrganoDeGobierno"))
        end
        current_iniciadores_organos << value["id"]
      end

      old_iniciadores_areas = @comunicacion_oficial.areas.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_areas.include?(value["id"])
          @comunicacion_oficial.areas << Area.where(id: value["id"]) if ((value["type"] == "Area"))
        end
        current_iniciadores_areas << value["id"]
      end

      old_iniciadores_bloques = @comunicacion_oficial.bloques.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_bloques.include?(value["id"])
          @comunicacion_oficial.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        end
        current_iniciadores_bloques << value["id"]
      end

      old_iniciadores_comisions = @comunicacion_oficial.comisions.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_comisions.include?(value["id"])
          @comunicacion_oficial.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
        end
        current_iniciadores_comisions << value["id"]
      end

      old_iniciadores_reparticiones = @comunicacion_oficial.reparticion_oficials.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_reparticiones.include?(value["id"])
          @comunicacion_oficial.reparticion_oficials << ReparticionOficial.where(id: value["id"]) if ((value["type"] == "ReparticionOficial"))
        end
        current_iniciadores_reparticiones << value["id"]
      end

      old_iniciadores_dependencias = @comunicacion_oficial.dependencia_municipals.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_dependencias.include?(value["id"])
          @comunicacion_oficial.dependencia_municipals << DependenciaMunicipal.where(id: value["id"]) if ((value["type"] == "DependenciaMunicipal"))
        end
        current_iniciadores_dependencias << value["id"]
      end

      # delete iniciadores
      (old_iniciadores_organos - current_iniciadores_organos).each { |id| @comunicacion_oficial.organo_de_gobiernos.delete(id) }
      (old_iniciadores_areas - current_iniciadores_areas).each { |id| @comunicacion_oficial.areas.delete(id) }
      (old_iniciadores_personas - current_iniciadores_personas).each { |id| @comunicacion_oficial.personas.delete(id) }
      (old_iniciadores_bloques - current_iniciadores_bloques).each { |id| @comunicacion_oficial.bloques.delete(id) }
      (old_iniciadores_comisions - current_iniciadores_comisions).each { |id| @comunicacion_oficial.comisions.delete(id) }
      (old_iniciadores_reparticiones - current_iniciadores_reparticiones).each { |id| @comunicacion_oficial.reparticion_oficials.delete(id) }
      (old_iniciadores_dependencias - current_iniciadores_dependencias).each { |id| @comunicacion_oficial.dependencia_municipals.delete(id) }
    end

    ## update params states the PATCH
    if params['states'].present?
      current_states = []
      old_states = @comunicacion_oficial.estado_tramites.where(tipo: 2).map{ |x| x.id }
      JSON.parse(params['states']).each do |key, value|
        unless old_states.include?(value["id"])
          @comunicacion_oficial.estado_tramites.create do |e|
            e.nombre = "derivado"
            e.tipo = 2
            e.ref_id = value["idref"]
            e.ref_type = value["typeref"]
          end
        end
        current_states << value["id"]
      end
      # delete states
      (old_states - current_states).each { |id| @comunicacion_oficial.estado_tramites.delete(id) }
    end

    redirect_to action: :index
  end

  def get_iniciador
    organos = OrganoDeGobierno.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(2)
    areas = Area.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    com = Periodo.last.comisions.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    bloques = Periodo.last.bloques.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    repart = ReparticionOficial.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    depend = DependenciaMunicipal.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    conc = Periodo.last.concejals.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
                                   "%#{params[:q]}%").order(apellido: :asc).first(7)
    ##per = Persona.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
    ##                               "%#{params[:q]}%").where.not(type: "Concejal").order(apellido: :asc).first(7)
    organos = organos.as_json(methods: 'type')
    areas = areas.as_json(methods: 'type')
    com = com.as_json(methods: 'type')
    bloques = bloques.as_json(methods: 'type')
    repart = repart.as_json(methods: 'type')
    depend = depend.as_json(methods: 'type')
    conc = conc.as_json(methods: 'type' )
    ##per = per.as_json(methods: 'type' )
    q = organos + areas + bloques + com + repart + depend + conc ##+ per
    agregar_nuevo = {"id"=>nil, "nombre"=>"", "apellido"=>"Agregar Nuevo", "tipo_doc"=>nil, "nro_doc"=>"", "telefono"=>"", "email"=>"", "domicilio"=>"", "cargo"=>nil, "bloque_id"=>nil, "created_at"=>nil, "updated_at"=>nil, "cuit"=>0, "type"=>""}
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
    com = com.as_json(methods: 'type')
    areas = areas.as_json(methods: 'type')
    bloques = bloques.as_json(methods: 'type')
    personal = personal.as_json(methods: 'type' )
    q = areas + com + bloques + personal
    render json: q
  end

  private

  def comunicacion_oficial_params
    params.require(:comunicacion_oficial).permit("nro_fojas", "asunto", "updated_at",  "observaciones")
  end

end
