class ComunicacionesOficialesController < ApplicationController
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
      format.html {render partial: "modal_communicacion_oficial", locals: { actionvar: "create"}}
    end
  end

  def show
    @comunicacion_oficial = ComunicacionOficial.find(params[:id])
  end

  def edit
    @comunicacion_oficial = ComunicacionOficial.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_communicacion_oficial", locals: { actionvar: "update"}}
    end
  end

  def destroy
    ComunicacionOficial.find(params[:id]).delete
  end

  def create
    cond = params[:comunicacion_oficial].select { |key, value| ["nro_fojas", "fecha", "observaciones"].include?(key) }
    @comunicacion_oficial = ComunicacionOficial.create cond.to_hash

    ## get params comisions the POST
    comisions = params[:comunicacion_oficial][:comisions]
    unless comisions.blank?
      @comunicacion_oficial.comisions << Comision.where(id: comisions)
    end

    ## get params concejals the POST
    concejals = params[:comunicacion_oficial][:concejals]
    unless concejals.blank?
      @comunicacion_oficial.concejals << Concejal.where(id: concejals)
    end

    ## get params exps_ids the POST
    expedientes = params[:exps_ids]
    unless expedientes.blank?
      @comunicacion_oficial.expedientes << Expediente.where(id: expedientes)
    end

    redirect_to action: :index
  end

  def update
    cond = params[:comunicacion_oficial].select { |key, value| ["nro_fojas", "fecha","observaciones"].include?(key) }
    @comunicacion_oficial = ComunicacionOficial.find(params[:id])

    @comunicacion_oficial.update cond.to_hash

    redirect_to action: :index
  end

  private

  def comunicacion_oficial_params
    params.require(:comunicacion_oficial).permit("nro_fojas", "fecha",  "observaciones")
  end

end
