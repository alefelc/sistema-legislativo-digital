class ExpedientesController < ApplicationController
  before_action :authenticate_usuario!

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: ExpedienteDatatable.new(view_context) }
    end
  end

  def new
    @expediente = Expediente.new
    respond_to do |format|
      format.html { render partial: "modal_expediente", locals: { actionvar: "create" } }
    end
  end

  def show

  end

  def edit
    @expediente = Expediente.find params[:id]
    respond_to do |format|
      format.html { render partial: "modal_expediente", locals: { actionvar: "update" } }
    end
  end

  def destroy

  end

  def create
    Expediente.create params[:expediente].to_hash
    redirect_to action: :index
  end

  def update

  end

  def get_tramites_pendientes
    render json: Tramite.last(10)
  end

  private

  def expediente_params
    params.require(:expediente).permit("nro_fojas", "tema",  "anio", "observacion", "bis")
  end

end
