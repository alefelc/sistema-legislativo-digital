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

  end

  def destroy

  end

  def create
    @expediente = Expediente.create params[:expediente]
    redirect_to action: :index
  end

  def update

  end

end
