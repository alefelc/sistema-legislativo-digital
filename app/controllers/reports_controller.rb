class ReportsController < ApplicationController
  #before_action :authenticate_user!

  respond_to :json, :html

  def mesa_de_entradas
    respond_to do |format|
      format.html
      format.json { render json: TramiteDatatable.new(view_context) }
    end
  end

  def expedientes
    respond_to do |format|
      format.html
      format.json { render json: ExpedienteReportDatatable.new(view_context) }
    end
  end

  def normas

  end
end
