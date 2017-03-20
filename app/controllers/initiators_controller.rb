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
    render json: build_response
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
        w = "name ilike ? or surname ilike ?"
        Fisica.where(w, q, q).to_json only: :id, methods: :text
      when 'particular_legal'
        w = "name ilike ?"
        Juridica.where(w, q).to_json only: :id, methods: :text
      end
    else
      #InitiatorsDatatable.new(view_context)
    end
  end

  def build_response
    case params[:type]
    when 'official_distribution'
      text = Concejal.find(params[:councilor_id]).fullname_with_dni
      { text: "Repartición Oficial: #{text}" }
    when 'municipal_office'
      text = Concejal.find(params[:councilor_id]).fullname_with_dni
      { text: "Dependencia Municipal: #{text}" }
    when 'particular_pyshic'
      text = Concejal.find(params[:councilor_id]).fullname_with_dni
      { text: "Particular Físico: #{text}" }
    when 'particular_legal'
      text = Concejal.find(params[:councilor_id]).fullname_with_dni
      { text: "Particular Jurídico: #{text}" }
    end
  end
end
