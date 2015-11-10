class ParticularsController < ApplicationController
  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: ParticularDatatable.new(view_context) }
    end
  end

  def new
    @particular = Peticion.new
    respond_to do |format|
      format.html {render partial: "modal_particular", locals: { actionvar: "create"}}
    end
  end

  def show
    @particular = Peticion.find(params[:id])
  end

  def edit
    @particular = Peticion.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_particular", locals: { actionvar: "update"}}
    end
  end

  def destroy
    Peticion.find(params[:id]).delete
    render json: {url: "/particulars"}
  end

  def create
    part = params[:peticion].select { |key, value| ["nro_fojas", "asunto", "updated_at", "observaciones"].include?(key) }
    @particular = Peticion.create part.to_hash

    ## get params iniciadores the POST
    unless params[:iniciadores].blank?
      JSON.parse(params['iniciadores']).each do |key, value|
        @particular.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        @particular.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        @particular.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
      end
    end

    ## add state initial
    @particular.estado_tramites.create do |e|
      e.nombre = "iniciado"
      e.tipo = 1
    end

    ## get params states the POST and save
    unless params[:states].blank?
      JSON.parse(params['states']).each do |key, value|
        @particular.estado_tramites.create do |e|
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
    part = params[:peticion].select { |key, value| ["nro_fojas", "updated_at", "asunto","observaciones"].include?(key) }
    @particular = Peticion.find(params[:id])
    @particular.update part.to_hash

    if params['iniciadores'].present?
      ## update params iniciadores the PATCH
      current_iniciadores_personas = []
      current_iniciadores_bloques = []
      current_iniciadores_comisions = []
      old_iniciadores_personas = @particular.personas.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_personas.include?(value["id"])
          @particular.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        end
        current_iniciadores_personas << value["id"]
      end

      old_iniciadores_bloques = @particular.bloques.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_bloques.include?(value["id"])
          @particular.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        end
        current_iniciadores_bloques << value["id"]
      end

      old_iniciadores_comisions = @particular.comisions.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_comisions.include?(value["id"])
          @particular.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
        end
        current_iniciadores_comisions << value["id"]
      end

      # delete iniciadores
      (old_iniciadores_personas - current_iniciadores_personas).each { |id| @particular.personas.delete(id) }
      (old_iniciadores_bloques - current_iniciadores_bloques).each { |id| @particular.bloques.delete(id) }
      (old_iniciadores_comisions - current_iniciadores_comisions).each { |id| @particular.comisions.delete(id) }
    end

    ## update params states the PATCH
    if params['states'].present?
      current_states = []
      old_states = @particular.estado_tramites.where(tipo: 2).map{ |x| x.id }
      JSON.parse(params['states']).each do |key, value|
        unless old_states.include?(value["id"])
          @particular.estado_tramites.create do |e|
            e.nombre = "derivado"
            e.tipo = 2
            e.ref_id = value["idref"]
            e.ref_type = value["typeref"]
          end
        end
        current_states << value["id"]
      end
      # delete states
      (old_states - current_states).each { |id| @particular.estado_tramites.delete(id) }
    end

    redirect_to action: :index
  end

  def get_iniciador
    com = Comision.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    bloques = Bloque.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    per = Persona.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
                                   "%#{params[:q]}%").order(apellido: :asc).first(7)
    com = com.as_json(methods: 'type')
    bloques = bloques.as_json(methods: 'type')
    per = per.as_json(methods: 'type' )
    q = com + bloques + per
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
    per = Persona.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
                                   "%#{params[:q]}%").order(apellido: :asc).first(7)
    areas = areas.as_json(methods: 'type')
    com = com.as_json(methods: 'type')
    bloques = bloques.as_json(methods: 'type')
    per = per.as_json(methods: 'type' )
    q = areas + com + bloques + per
    render json: q
  end

  private

  def particular_params
    params.require(:peticion).permit("nro_fojas", "asunto", "updated_at",  "observaciones")
  end

end
