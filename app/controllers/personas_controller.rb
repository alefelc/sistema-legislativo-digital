class PersonasController < ApplicationController
  respond_to :json, :html

  def create
    pers = params[:persona]
    @persona = Persona.create pers.to_hash

    render :json => { 
      :status => :ok, 
      :message => "Success!",
      :iniciador => @persona.as_json(methods: 'type' )
    }.to_json
  end

  def update
    pers = params[:persona]

    @persona = Persona.find(params[:id])
    @persona.update pers.to_hash

    render :json => { 
      :status => :ok, 
      :message => "Success!",
      :iniciador => @persona.as_json(methods: 'type' )
    }.to_json
  end 

  private

  def personas_params
    params.require(:persona).permit("type", "nombre", "apellido", "email", "nro_doc", "telefono", "domicilio", "cuit")
  end

end
