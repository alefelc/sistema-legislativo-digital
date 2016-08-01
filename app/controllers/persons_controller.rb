class PersonsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  respond_to :json, :html

  def create
    pers = params[:person]
    @person = Person.create pers.to_hash

    render json: {
      status: :ok,
      message: "Success!",
      iniciador: @person.as_json(methods: 'type' )
    }.to_json
  end

  def update
    pers = params[:person]

    @person = Person.find(params[:id])
    @person.update pers.to_hash

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

  private

  def persons_params
    params.require(:person).permit :type, :nombre, :apellido, :email, :nro_doc,
                                   :telefono, :domicilio, :cuit
  end
end
