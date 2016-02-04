class ExpedienteReportsController < ApplicationController
  # before_action :authenticate_usuario!

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: ExpedienteReportDatatable.new(view_context) }
    end
  end

  def new

  end

  def show

  end

  def edit

  end

  def destroy

  end

  def create

  end

  def update

  end

  private

  def expediente_report_params
    params.require(:expediente).permit("nro_fojas", "tema", "anio", "observacion")
  end

end
