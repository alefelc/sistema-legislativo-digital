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
    ### IMPROVE THIS
    ## GET THIS AREA FROM PROCEDURE INDEX HEADER... also implements users derivations with possible notification system.
    derivation.area = Area.find_by name: "Secretaría Legislativa"

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

  def resolve_pendants
    begin
      pendants = ProcedureDerivation.where received_at: nil
      pendants.update_all received_by: current_user, received_at: DateTime.current
    rescue Exception
      return render json: {
        status: 'Something went wrong',
        errors: pendants.map(&:errors)
      }, status: 500
    end
    render json: { status: 'OK' }, status: 200
  end

  def resolve
    begin
      # 8040 is the number before to start derivations module
      pendants = Procedure.where 'id > 8040 AND procedure_derivation_id IS null'
      secretary = Area.find_by name: "Secretaría Legislativa"

      pendants.each do |procedure|
        ProcedureDerivation.create do |derivation|
          derivation.procedure_id = procedure.id
          derivation.derived_by = current_user
          derivation.derived_at = DateTime.current
          derivation.area = secretary
        end
      end
    rescue Exception
      return render json: {
        status: 'Something went wrong',
        errors: pendants.map(&:errors)
      }, status: 500
    end
    render json: { status: 'OK' }, status: 200
  end

  private

  def derivation_params
    params.permit(:procedure_id)
  end
end
