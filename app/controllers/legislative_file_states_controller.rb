class LegislativeFileStatesController < ApplicationController
  def new
    @legislative_file_state = LegislativeFile.find(params[:legislative_file_id])
      .legislative_file_states.build

    render layout: false
  end

  def edit
    @legislative_file_state = LegislativeFileState.find params[:id]

    render layout: false
  end

  def create
    state = LegislativeFileState.new state_params
    if state.save
      render json: { success: :OK }
    else
      render json: { errors: state.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    state = LegislativeFileState.find params[:id]
    if state.update state_params
      render json: { success: :OK }
    else
      render json: { errors: state.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    state = LegislativeFileState.find params[:id]
    file = state.legislative_file
    if state.destroy
      flash[:success] = "Estado eliminado correctamente"
      render json: { status: :OK }
    else
      flash[:error] = "No se ha podido eliminar el estado"
      render json: { error: state.errors.full_messages }, status: :forbidden
    end
  end

  def state_params
    params.require(:legislative_file_state).permit :legislative_file_id, :name,
      :date_at, :state_type, :legislative_session_id, :sanction_specified, :sanction_type,
      comision_ids: [], law_ids: []
  end
end
