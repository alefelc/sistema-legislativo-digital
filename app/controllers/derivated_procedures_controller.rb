class DerivatedProceduresController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: ProcedureDerivationDatatable.new(view_context) }
    end
  end

  def create
    derivation = ProcedureDerivation.new derivation_params
    derivation.derived_by = current_user
    derivation.derived_at = DateTime.current
    derivation.area = Area.find_by name: "Secretaria Legislativa"

    if derivation.save
      render json: derivation
    else
      render json: derivation.errors
    end
  end

  def edit
  end

  def update
    derivation = ProcedureDerivation.find params[:id]
    derivation.received_by = current_user
    derivation.received_at = DateTime.current

    if derivation.save
      render json: derivation
    else
      render json: derivation.errors
    end
  end

  private

  def derivation_params
    params.permit(:procedure_id)
  end
end
