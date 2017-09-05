class PersonsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json, :html

  def create
    person = Person.new persons_params

    if person.save!
      response = { message: "Success!", iniciador: person.as_json(methods: 'type') }
      render json: response, status: :ok
    else
      response = { message: person.errors }
      render json: response, status: :bad_request
    end
  end

  def update
    pers = params[:person]

    @person = Person.find(params[:id])
    @person.update persons_params

    render json: {
      status: :ok,
      message: "Success!",
      iniciador: @person.as_json(methods: 'type' )
    }.to_json
  end

  def show
    @person = Person.find(params[:id])
  end

  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json }
    end
  end

  def edit
    @person = Person.find params[:id]
    render layout: false
  end

  def new
    @person = Person.new
    render layout: false
  end

  private

  def build_json
    if params[:select_q]
      q = "%#{params[:select_q]}%"
      w = "concat(surname, ' ', name) ilike ? or "
      w += "concat(name, ' ', surname) ilike ? or "
      w += "cuit_or_dni ilike ?"
      Person.where(w, q, q, q).to_json only: :id, methods: :text
    else
      PeopleDatatable.new(view_context)
    end
  end

  def persons_params
    params.require(:person).permit :type, :name, :surname, :cuit_or_dni, :phone,
      :cuit_or_dni, :address, :position, :email, :bloque_id
  end
end
