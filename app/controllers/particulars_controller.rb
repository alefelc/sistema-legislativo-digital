class ParticularsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: ParticularDatatable.new(view_context) }
    end
  end

  def new
    @process = Peticion.new
    @upload = Upload.new
    render layout: false
  end

  def show
    @particular = Peticion.find(params[:id])
  end

  def edit
    @process = Peticion.find(params[:id])
    @upload = Upload.new
    @process_id = params[:id]
    render layout: false
  end

  def destroy
    Peticion.find(params[:id]).delete
    render json: { url: '/particulars' }
  end

  def create
    part = params[:peticion].select { |key, value| ["type", "nro_fojas", "asunto", "updated_at", "observaciones"].include?(key) }
    @particular = Peticion.create part.to_hash

    if params[:peticion][:upload].present?
      params[:peticion][:upload][:file].each do |file|
        upload = @particular.uploads.build
        upload.file = file
        upload.save
      end
    end

    ## get params iniciadores the POST
    unless params[:iniciadores].blank?
      JSON.parse(params['iniciadores']).each do |key, value|
        @particular.persons << Person.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica"))
      end
    end

    ## get params states the POST and save
    unless params[:states].blank?
      JSON.parse(params['states']).each do |key, value|
        @particular.estado_tramites.create do |e|
          e.nombre = "Derivado"
          e.tipo = 2
          e.ref_id = value["idref"]
          e.ref_type = value["typeref"]
        end
      end
    end

    ## add final state
    unless params[:finalizado].blank?
      @particular.estado_tramites.create do |e|
        e.nombre = "Finalizado"
        e.especificacion = params[:finalizado]
        e.tipo = 4
      end
    end

    unless params[:expediente_administrativo].blank?
      @particular.expediente_administrativos.create do |e|
        e.nro_exp = params[:expediente_administrativo]
        e.nro_fojas = params[:fojas_exp_adm]
      end
    end

    redirect_to action: :index
  end

  def update
    part = params[:peticion].select { |key, value| ["type", "nro_fojas", "updated_at", "asunto","observaciones"].include?(key) }
    @particular = Peticion.find(params[:id])
    @particular.update part.to_hash

    if params[:peticion][:upload].present?
      params[:peticion][:upload][:file].each do |file|
        upload = @particular.uploads.build
        upload.file = file
        upload.save
      end
    end

    if params['iniciadores'].present?
      ## update params iniciadores the PATCH
      current_iniciadores_persons = []
      current_iniciadores_bloques = []
      current_iniciadores_comisions = []
      old_iniciadores_persons = @particular.persons.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_persons.include?(value["id"])
          @particular.persons << Person.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica"))
        end
        current_iniciadores_persons << value["id"]
      end

      ##old_iniciadores_bloques = @particular.bloques.map{ |x| x.id }
      ##JSON.parse(params['iniciadores']).each do |key, value|
      ##  unless old_iniciadores_bloques.include?(value["id"])
      ##    @particular.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
      ##  end
      ##  current_iniciadores_bloques << value["id"]
      ##end

      ##old_iniciadores_comisions = @particular.comisions.map{ |x| x.id }
      ##JSON.parse(params['iniciadores']).each do |key, value|
      ##  unless old_iniciadores_comisions.include?(value["id"])
      ##    @particular.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
      ##  end
      ##  current_iniciadores_comisions << value["id"]
      ##end

      # delete iniciadores
      (old_iniciadores_persons - current_iniciadores_persons).each { |id| @particular.persons.delete(id) }
      ##(old_iniciadores_bloques - current_iniciadores_bloques).each { |id| @particular.bloques.delete(id) }
      ##(old_iniciadores_comisions - current_iniciadores_comisions).each { |id| @particular.comisions.delete(id) }
    end

    ## update params states the PATCH
    if params['states'].present?
      current_states = []
      old_states = @particular.estado_tramites.where(tipo: 2).map{ |x| x.id }
      JSON.parse(params['states']).each do |key, value|
        unless old_states.include?(value["id"])
          @particular.estado_tramites.create do |e|
            e.nombre = "Derivado"
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

    ## update final state
    finalizado = params[:finalizado]
    unless finalizado.blank?
      estado = @particular.estado_tramites.find_by(tipo: "4")
      if estado.present?
        estado.update especificacion: params[:finalizado]
      else
        @particular.estado_tramites.create do |e|
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
      if @particular.expediente_administrativos.present?
        @particular.expediente_administrativos.first.update_attributes exp
      else
        @particular.expediente_administrativos.create exp
      end
    end

    redirect_to action: :index
  end

  def get_iniciador
    ##com = Comision.where("denominacion ilike ?",
    ##                               "%#{params[:q]}%").first(7)
    ##bloques = Bloque.where("denominacion ilike ?",
    ##                               "%#{params[:q]}%").first(7)
    per = Person.where("CONCAT(apellido, ' ' , nombre, nro_doc) ilike ?",
                                   "%#{params[:q]}%").order(apellido: :asc).first(12)
    ##com = com.as_json(methods: 'type')
    ##bloques = bloques.as_json(methods: 'type')
    per = per.as_json(methods: 'type' )
    q = per ##com + bloques
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

  def particular_params
    params.require(:peticion).permit(:nro_fojas, :asunto, :updated_at,
                                     :observaciones, upload: [:file])
  end
end
