class DependenciaMunicipalsController < ApplicationController
  respond_to :json, :html

  def create
    depend = params[:dependencia]
    @dependencia = MunicipalOffice.create depend.to_hash

    render :json => {
      :status => :ok,
      :message => "Success!",
      :iniciador => @dependencia.as_json(methods: 'type' )
    }.to_json
  end

  def update
    depend = params[:dependencia]

    @dependencia = MunicipalOffice.find(params[:id])
    @dependencia.update depend.to_hash

    render :json => {
      :status => :ok,
      :message => "Success!",
      :iniciador => @dependencia.as_json(methods: 'type' )
    }.to_json
  end

  private

  def dependencias_params
    params.require(:dependencia).permit("type", "denominacion")
  end

end
