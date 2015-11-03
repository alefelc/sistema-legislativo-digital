class ProyectosController < ApplicationController
  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProyectoDatatable.new(view_context) }
    end
  end

  def new
    @proyecto = Proyecto.new
    respond_to do |format|
      format.html {render partial: "modal_proyecto", locals: { actionvar: "create"}}
    end
  end

  def show
    @proyecto = Proyecto.find(params[:id])
  end

  def edit
    @proyecto = Proyecto.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_proyecto", locals: { actionvar: "update"}}
    end
  end

  def destroy
    Proyecto.find(params[:id]).delete
    render json: {url: "/proyectos"}
  end

  def create
    pro = params[:proyecto].select { |key, value| ["nro_fojas", "asunto", "updated_at", "observaciones"].include?(key) }
    @proyecto = Proyecto.create pro.to_hash

    ## get params iniciadores the POST
    unless params[:iniciadores].blank?
      JSON.parse(params['iniciadores']).each do |key, value|
        @proyecto.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        @proyecto.bloques << Bloque.where(id: value["id"]) if ((value["type"] == "Bloque"))
        @proyecto.comisions << Comision.where(id: value["id"]) if ((value["type"] == "Comision"))
      end
    end

    redirect_to action: :index
  end

  def update
    pro = params[:proyecto].select { |key, value| ["nro_fojas", "updated_at", "asunto","observaciones"].include?(key) }
    @proyecto = Proyecto.find(params[:id])
    @proyecto.update pro.to_hash

    if params['iniciadores'].present?
      ## update params iniciadores the PATCH
      current_iniciadores_personas = []
      current_iniciadores_bloques = []
      current_iniciadores_comisions = []
      old_iniciadores_personas = @proyecto.personas.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores_personas.include?(value["id"])
          @proyecto.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        end
        current_iniciadores_personas << value["id"]
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

      # delete iniciadores
      (old_iniciadores_personas - current_iniciadores_personas).each { |id| @proyecto.personas.delete(id) }
      (old_iniciadores_bloques - current_iniciadores_bloques).each { |id| @proyecto.bloques.delete(id) }
      (old_iniciadores_comisions - current_iniciadores_comisions).each { |id| @proyecto.comisions.delete(id) }
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

  def proyecto_params
    params.require(:proyecto).permit("nro_fojas", "asunto", "updated_at",  "observaciones")
  end

end
