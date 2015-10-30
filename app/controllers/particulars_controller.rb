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
      current_iniciadores = []
      old_iniciadores = @particular.personas.map{ |x| x.id }
      JSON.parse(params['iniciadores']).each do |key, value|
        unless old_iniciadores.include?(value["id"])
          @particular.personas << Persona.where(id: value["id"]) if ((value["type"] == "Fisica") || (value["type"] == "Juridica") || (value["type"] == "Concejal"))
        end
        current_iniciadores << value["id"]
      end
      # delete iniciadores
      (old_iniciadores - current_iniciadores).each { |id| @particular.personas.delete(id) }
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

  private

  def particular_params
    params.require(:peticion).permit("nro_fojas", "asunto", "updated_at",  "observaciones")
  end

end
