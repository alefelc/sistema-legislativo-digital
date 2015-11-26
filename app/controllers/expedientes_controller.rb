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
    @expediente = Expediente.find(params[:id])
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
    exp = params[:expediente]
    @expediente = Expediente.create exp.to_hash

    @circuito = Circuito.create nro: 0, expediente: @expediente

    ## set initial state
    @circuito.estado_expedientes.create do |e|
      e.nombre = "Iniciado"
      e.tipo = 1
      e.fecha = @expediente.anio
    end

    ##add relation exp and tramites
    unless params[:tramites_pendientes].blank?
      JSON.parse(params[:tramites_pendientes]).each do |key, value|
        tramite = Tramite.find(value["id"])
        @circuito.tramite = tramite
        @circuito.save

        #set finalized state to tramite
        tramite.estado_tramites.create do |e|
          e.nombre = "Finalizado"
          e.tipo = 3
          e.ref_id = @expediente.id
          e.ref_type = @expediente.type
        end
      end
    end

    redirect_to action: :index
  end

  def update

  end

  def get_tramites_pendientes
    tramites = Tramite.where("id::text ilike ?",
                                   "%#{params[:q]}%").where(pendiente: true).order(updated_at: :desc).first(10)
    render json: tramites.as_json(methods: 'type')
  end

  private

  def expediente_params
    params.require(:expediente).permit("nro_fojas","tema",  "anio", "observacion", "bis")
  end

end
