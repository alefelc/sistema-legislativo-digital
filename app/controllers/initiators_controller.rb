class InitiatorsController < ApplicationController
  def new
    @initiator = InitiatorForm.new
    render layout: false
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: get_index_json }
    end
  end

  def create
    build_initiator
    render json: @initiator.to_json(only: :id, methods: :text)
  end

  def update
  end

  private
  def get_index_json
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      case params[:value]
      when 'official_distribution'
        w = "denominacion ilike ?"
        ReparticionOficial.where(w, q).to_json only: :id, methods: :text
      when 'municipal_office'
        w = "denominacion ilike ?"
        MunicipalOffice.where(w, q).to_json only: :id, methods: :text
      when 'particular_pyshic'
        w = "concat(surname, ' ', name) ilike ? or "
        w += "concat(name, ' ', surname) ilike ? or "
        w += "cuit_or_dni ilike ?"
        Fisica.where(w, q, q, q).to_json only: :id, methods: :text
      when 'particular_legal'
        w = "name ilike ?"
        Juridica.where(w, q).to_json only: :id, methods: :text
      # dispatch
      when 'councilors'
        w = "concat(surname, ' ', name) ilike ? or "
        w += "concat(name, ' ', surname) ilike ? or "
        w += "cuit_or_dni ilike ?"
        councilors = Periodo.last.available_concejals.order(:surname).where(w, q, q, q)#.to_json only: :id, methods: :text
        [{
          text: 'Integrantes de las comisiones seleccionadas',
          children: councilors.select{ |x| x.comisions.exists?(id: params[:commissions]) }.as_json(only: :id, methods: :text)
        },
        {
          text: 'Otros integrantes',
          children: councilors.select{ |x| !x.comisions.exists?(id: params[:commissions]) }.as_json(only: :id, methods: :text)
        }]
      when 'commissions'
        w = "denominacion ilike ?"
        Periodo.last.comisions.where(w, q).to_json only: :id, methods: :text
      when 'partisan_block'
        w = "denominacion ilike ?"
        Periodo.last.bloques.where(w, q).to_json only: :id, methods: :text
      end
    else
      #InitiatorsDatatable.new(view_context)
    end
  end

  def build_initiator
    fields = params[:initiator_form]
    @initiator = case fields[:type]
    when 'municipal_office'
      MunicipalOffice.create denominacion: fields[:denomination]
    when 'official_distribution'
      ReparticionOficial.create denominacion: fields[:denomination]
    when 'particular_pyshic'
      Fisica.create name: fields[:name], surname: fields[:surname]
    when 'particular_legal'
      Juridica.create name: fields[:denomination]
    end
  end

  ## Missing STRONG PARAMETERS HERE!!!
  def initiators_params
    params.require(:initiator_form).permit(:denomination, :name, :surname, :type)
  end
end
