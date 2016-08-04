class ProyectosController < ApplicationController
  before_action :authenticate_user!, { except: [:show, :index] }

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProyectoDatatable.new(view_context) }
    end
  end

  def new
    @process = Proyecto.new
    @upload = Upload.new
    render layout: false
  end

  def show
    @proyecto = Proyecto.find params[:id]
  end

  def edit
    @process = Proyecto.find params[:id]
    @process_id = params[:id]
    @upload = Upload.new
    render layout: false
  end

  def destroy
    Proyecto.find(params[:id]).delete
    render json: { url: '/proyectos' }
  end

  def create
    pro = params[:proyecto].select { |key, value| ["type", "nro_fojas", "asunto", "updated_at", "observaciones"].include?(key) }
    @proyecto = Proyecto.create pro.to_hash

    if params[:proyecto][:upload].present?
      params[:proyecto][:upload][:file].each do |file|
        upload = @proyecto.uploads.build
        upload.file = file
        upload.save
      end
    end

    ## get params iniciadores the POST
    unless params[:iniciadores].blank?
      JSON.parse(params['iniciadores']).each do |key, value|
        @proyecto.persons << Person.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        @proyecto.reparticion_oficials << ReparticionOficial.where(id: value["id"]) if ((value["type"] == "ReparticionOficial"))
        @proyecto.dependencia_municipals << DependenciaMunicipal.where(id: value["id"]) if ((value["type"] == "DependenciaMunicipal"))
        @proyecto.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        @proyecto.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
        @proyecto.organo_de_gobiernos << OrganoDeGobierno.where(id: value["id"]) if ((value["type"] == "OrganoDeGobierno"))
        @proyecto.areas << Area.where(id: value["id"]) if ((value["type"] == "Area"))
      end
    end

    ## get params states the POST and save
    unless params[:states].blank?
      JSON.parse(params['states']).each do |key, value|
        @proyecto.estado_tramites.create do |e|
          e.nombre = "Derivado"
          e.tipo = 2
          e.ref_id = value["idref"]
          e.ref_type = value["typeref"]
        end
      end
    end

    ## add final state
    unless params[:finalizado].blank?
      @proyecto.estado_tramites.create do |e|
        e.nombre = "Finalizado"
        e.especificacion = params[:finalizado]
        e.tipo = 4
      end
    end

    unless params[:expediente_administrativo].blank?
      @proyecto.expediente_administrativos.create do |e|
        e.nro_exp = params[:expediente_administrativo]
        e.nro_fojas = params[:fojas_exp_adm]
      end
    end

    redirect_to action: :index
  end

  def update
    pro = params[:proyecto].select { |key, value| ["type", "nro_fojas", "updated_at", "asunto","observaciones"].include?(key) }
    @proyecto = Proyecto.find(params[:id])
    @proyecto.update pro.to_hash

    if params[:proyecto][:upload].present?
      params[:proyecto][:upload][:file].each do |file|
        upload = @proyecto.uploads.build
        upload.file = file
        upload.save
      end
    end

    if params['iniciadores'].present?
      ## update params iniciadores the PATCH
      current_iniciadores_persons = []
      current_iniciadores_organos = []
      current_iniciadores_areas = []
      current_iniciadores_bloques = []
      current_iniciadores_comisions = []
      current_iniciadores_reparticiones = []
      current_iniciadores_dependencias = []
      old_iniciadores_persons = @proyecto.persons.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_persons.include?(value["id"])
          @proyecto.persons << Person.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        end
        current_iniciadores_persons << value["id"]
      end

      old_iniciadores_organos = @proyecto.organo_de_gobiernos.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_organos.include?(value["id"])
          @proyecto.organo_de_gobiernos << OrganoDeGobierno.where(id: value["id"]) if ((value["type"] == "OrganoDeGobierno"))
        end
        current_iniciadores_organos << value["id"]
      end

      old_iniciadores_areas = @proyecto.areas.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_areas.include?(value["id"])
          @proyecto.areas << Area.where(id: value["id"]) if ((value["type"] == "Area"))
        end
        current_iniciadores_areas << value["id"]
      end

      old_iniciadores_bloques = @proyecto.bloques.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_bloques.include?(value["id"])
          @proyecto.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        end
        current_iniciadores_bloques << value["id"]
      end

      old_iniciadores_comisions = @proyecto.comisions.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_comisions.include?(value["id"])
          @proyecto.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
        end
        current_iniciadores_comisions << value["id"]
      end

      old_iniciadores_reparticiones = @proyecto.reparticion_oficials.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_reparticiones.include?(value["id"])
          @proyecto.reparticion_oficials << ReparticionOficial.where(id: value["id"]) if ((value["type"] == "ReparticionOficial"))
        end
        current_iniciadores_reparticiones << value["id"]
      end

      old_iniciadores_dependencias = @proyecto.dependencia_municipals.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_dependencias.include?(value["id"])
          @proyecto.dependencia_municipals << DependenciaMunicipal.where(id: value["id"]) if ((value["type"] == "DependenciaMunicipal"))
        end
        current_iniciadores_dependencias << value["id"]
      end

      # delete iniciadores
      (old_iniciadores_organos - current_iniciadores_organos).each { |id| @proyecto.organo_de_gobiernos.delete(id) }
      (old_iniciadores_areas - current_iniciadores_areas).each { |id| @proyecto.areas.delete(id) }
      (old_iniciadores_persons - current_iniciadores_persons).each { |id| @proyecto.persons.delete(id) }
      (old_iniciadores_bloques - current_iniciadores_bloques).each { |id| @proyecto.bloques.delete(id) }
      (old_iniciadores_comisions - current_iniciadores_comisions).each { |id| @proyecto.comisions.delete(id) }
      (old_iniciadores_reparticiones - current_iniciadores_reparticiones).each { |id| @proyecto.reparticion_oficials.delete(id) }
      (old_iniciadores_dependencias - current_iniciadores_dependencias).each { |id| @proyecto.dependencia_municipals.delete(id) }
    end

    ## update params states the PATCH
    if params['states'].present?
      current_states = []
      old_states = @proyecto.estado_tramites.where(tipo: 2).map{ |x| x.id }
      JSON.parse(params['states']).each do |key, value|
        unless old_states.include?(value["id"])
          @proyecto.estado_tramites.create do |e|
            e.nombre = "Derivado"
            e.tipo = 2
            e.ref_id = value["idref"]
            e.ref_type = value["typeref"]
          end
        end
        current_states << value["id"]
      end
      # delete states
      (old_states - current_states).each { |id| @proyecto.estado_tramites.delete(id) }
    end

    ## update final state
    finalizado = params[:finalizado]
    unless finalizado.blank?
      estado = @proyecto.estado_tramites.find_by(tipo: "4")
      if estado.present?
        estado.update especificacion: params[:finalizado]
      else
        @proyecto.estado_tramites.create do |e|
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
      if @proyecto.expediente_administrativos.present?
        @proyecto.expediente_administrativos.first.update_attributes exp
      else
        @proyecto.expediente_administrativos.create exp
      end
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
                                   "%#{params[:q]}%").first(3)
    repart = ReparticionOficial.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    depend = DependenciaMunicipal.where("denominacion ilike ?",
                                   "%#{params[:q]}%").first(7)
    conc = Periodo.last.concejals.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
                                   "%#{params[:q]}%").order(apellido: :asc).first(7)
    per = Person.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
                                   "%#{params[:q]}%").where.not(type: "Concejal").order(apellido: :asc).first(7)
    organos = organos.as_json(methods: 'type')
    areas = areas.as_json(methods: 'type')
    com = com.as_json(methods: 'type')
    bloques = bloques.as_json(methods: 'type')
    repart = repart.as_json(methods: 'type')
    depend = depend.as_json(methods: 'type')
    conc = conc.as_json(methods: 'type' )
    per = per.as_json(methods: 'type' )
    q = organos + areas + bloques + com + repart + depend + conc + per
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

  def destroy_uploads
    @upload = Upload.find(params[:upload])
    if @upload.delete
      render json:  { success: :ok }
    else
      render json: @upload.errors
    end
  end

  private

  def proyecto_params
    params.require(:proyecto).permit(:nro_fojas, :asunto, :updated_at,
                                     :observaciones, upload: [:file])
  end

end
