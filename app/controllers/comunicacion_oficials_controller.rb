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
        @comunicacion_oficial.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        @comunicacion_oficial.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        @comunicacion_oficial.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
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
      current_iniciadores_bloques = []
      current_iniciadores_comisions = []
      old_iniciadores_personas = @comunicacion_oficial.personas.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_personas.include?(value["id"])
          @comunicacion_oficial.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        end
        current_iniciadores_personas << value["id"]
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

      # delete iniciadores
      (old_iniciadores_personas - current_iniciadores_personas).each { |id| @comunicacion_oficial.personas.delete(id) }
      (old_iniciadores_bloques - current_iniciadores_bloques).each { |id| @comunicacion_oficial.bloques.delete(id) }
      (old_iniciadores_comisions - current_iniciadores_comisions).each { |id| @comunicacion_oficial.comisions.delete(id) }
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
    render json: q
  end

  private

  def comunicacion_oficial_params
    params.require(:comunicacion_oficial).permit("nro_fojas", "asunto", "updated_at",  "observaciones")
  end

end
