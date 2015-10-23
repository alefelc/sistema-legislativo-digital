class CondonacionesController < ApplicationController
  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: CondonacionDatatable.new(view_context) }
    end
  end

  def new
    @condonacion = Condonacion.new
    respond_to do |format|
      format.html {render partial: "modal_condonacion", locals: { actionvar: "create"}}
    end
  end

  def show
    @condonacion = Condonacion.find(params[:id])
  end

  def edit
    @condonacion = Condonacion.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_condonacion", locals: { actionvar: "update"}}
    end
  end

  def destroy
    Condonacion.find(params[:id]).delete
  end

  def create
    cond = params[:condonacion].select { |key, value| ["nro_fojas", "fecha", "observaciones"].include?(key) }
    @condonacion = Condonacion.create cond.to_hash

    ## get params comisions the POST
    comisions = params[:condonacion][:comisions]
    unless comisions.blank?
      @condonacion.comisions << Comision.where(id: comisions)
    end

    ## get params concejals the POST
    concejals = params[:condonacion][:concejals]
    unless concejals.blank?
      @condonacion.concejals << Concejal.where(id: concejals)
    end

    ## get params exps_ids the POST
    expedientes = params[:exps_ids]
    unless expedientes.blank?
      @condonacion.expedientes << Expediente.where(id: expedientes)
    end

    redirect_to action: :index
  end

  def update
    cond = params[:condonacion].select { |key, value| ["nro_fojas", "fecha","observaciones"].include?(key) }
    @condonacion = Condonacion.find(params[:id])

    @condonacion.update cond.to_hash

    redirect_to action: :index
  end

  private

  def condonacion_params
    params.require(:condonacion).permit("nro_fojas", "fecha",  "observaciones")
  end

end
