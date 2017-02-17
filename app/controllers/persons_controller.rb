class PersonsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

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
      format.json { render json: PeopleDatatable.new(view_context) }
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

  def persons_params
    params.require(:person).permit :type, :name, :surname, :cuit_or_dni, :phone,
      :cuit_or_dni, :address, :position, :email, :bloque_id
  end
end
