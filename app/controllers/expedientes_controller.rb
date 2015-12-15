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

  def edit_circuit
    @expediente = Expediente.find params[:id]
    respond_to do |format|
      format.html { render partial: "modal_circuito", locals: { actionvar: "update" } }
    end
  end

  def destroy

  end

  def create
    exp = params[:expediente]
    @expediente = Expediente.create exp.to_hash

    ##add relation exp and tramites
    unless params[:tramites_pendientes].blank?
      JSON.parse(params[:tramites_pendientes]).each do |key, value|
        tramite = Tramite.find(value["id"])
        @expediente.circuitos.first.tramites << tramite

        #set finalized state to tramite
        tramite.estado_tramites.create do |e|
          e.nombre = "Finalizado"
          e.tipo = 3
          e.ref_id = @expediente.id
          e.ref_type = @expediente.type
        end
      end

      unless params[:adjunta_exp].blank?
        @expediente.adjunta = Expediente.find(params[:adjunta_exp])
      end

      unless params[:acumula_exp].blank?
        @expediente.acumula = Expediente.find(params[:acumula_exp])
      end
    end

    circuito = @expediente.circuitos.first

    if params[:estados_expedientes].present?
      new_states = JSON.parse(params[:estados_expedientes])
      new_states.each do |key, value|
        circuito.estado_expedientes.create do |ne|
          ne.tipo = value['tipo']
          ne.fecha = value['fecha']
          case value['tipo']
          when 2
            # orden del dia
            ne.nombre = "Orden del Día"
            ne.especificacion1 = value['especificacion1']
          when 3
            # a comision
            ne.nombre = "A Comisión"
            ne.especificacion1 = value['especificacion1']
          when 5
            # sancionado
            ne.nombre = "Sancionado"
            ne.especificacion1 = value['especificacion1']
            ne.especificacion2 = value['especificacion2']
          when 7
            # retirado
            ne.nombre = "Retirado"
          else
          end
        end
      end
    end

    ## get params tags_ids the POST
    params[:tags_ids].split(',').each { |id| @expediente.tags << Tag.find(id) } unless params[:tags_ids].blank?

    redirect_to action: :index
  end

  def update
    exp = params[:expediente]
    @expediente = Expediente.find params[:id]
    @expediente.update exp.as_json

    if params[:adjunta_exp].blank? && @expediente.adjunta.present?
      @expediente.adjunta.try :delete
    end
    if params[:adjunta_exp].present?
      @expediente.adjunta = Expediente.find(params[:adjunta_exp])
    end

    if params[:acumula_exp].blank? && @expediente.acumula.present?
      @expediente.adjunta.try :delete
    end
    if params[:acumula_exp].present?
      @expediente.acumula = Expediente.find(params[:acumula_exp])
    end

    circuito = @expediente.circuitos.find_by nro: 0
    current_tramites = []
    old_tramites = circuito.tramites.map{ |x| x.id }
    JSON.parse(params[:tramites_pendientes]).each do |key, value|
      unless old_tramites.include?(value["id"])
        tramite = Tramite.find(value["id"])
        circuito.tramites << tramite

        #set finalized state to tramite
        tramite.estado_tramites.create do |e|
          e.nombre = "Finalizado"
          e.tipo = 3
          e.especificacion = "Circuito Nro: " + circuito.nro.to_s
          e.ref_id = @expediente.id
          e.ref_type = @expediente.type
        end
      end
      current_tramites << value["id"]
    end

    # delete tramites and final state
    (old_tramites - current_tramites).each do |id|
      circuito.tramites.delete(id)
      tramite = Tramite.find(id)
      tramite.estado_tramites.find_by(ref_id: @expediente.id, tipo: "3").delete
      tramite.pendiente = true
      tramite.save
    end

    new_states = JSON.parse(params[:estados_expedientes])
    new_states.each do |key, value|
      circuito.estado_expedientes.create do |ne|
        ne.tipo = value['tipo']
        ne.fecha = value['fecha']
        case value['tipo']
        when 2
          # orden del dia
          ne.nombre = "Orden del Día"
          ne.especificacion1 = value['especificacion1']
        when 3
          # a comision
          ne.nombre = "A Comisión"
          ne.especificacion1 = value['especificacion1']
        when 5
          # sancionado
          ne.nombre = "Sancionado"
          ne.especificacion1 = value['especificacion1']
          ne.especificacion2 = value['especificacion2']
        when 7
          # retirado
          ne.nombre = "Retirado"
        else
        end
      end
    end

    ## update params tags_ids the PATCH
    current_tags = params[:tags_ids].split(',')
    old_tag = @expediente.tags.map{ |x| x.id.to_s }
    (current_tags - old_tag).each { |id| @expediente.tags << Tag.find(id) }
    (old_tag - current_tags).each { |id| @expediente.tags.delete(id) }

    redirect_to action: :index
  end

  def get_tramites_pendientes
    tramites = Tramite.where("id::text ilike ?",
                                   "%#{params[:q]}%").where(pendiente: true).order(updated_at: :desc).first(10)
    render json: tramites.as_json(methods: 'type')
  end

  def get_circuitos
    circuitos = Expediente.find(params[:id]).circuitos.where("nro <> 0").order(id: :asc)
    nuevo = [:id => "nuevo",
        :expediente_id => 23798,
                  :nro => circuitos.count+1,
                 :tema => nil,
                 :anio => nil,
                :fojas => nil,
              :type => "Agregar Nuevo"]
    render json: nuevo + circuitos.as_json(methods: ['get_tramites', 'estados'])
  end

  def search
    expedientes = Expediente.where("nro_exp ilike ?", "%#{params[:q]}%").first(10)
    render json: expedientes
  end

  def search_tag
    tags = Tag.where("nombre ilike '%#{params[:q]}%'").first(5)
    render json: tags
  end

  private

  def expediente_params
    params.require(:expediente).permit("nro_fojas", "tema", "anio", "observacion")
  end

end
