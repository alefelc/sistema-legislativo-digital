class AdministrativeFilesController < ApplicationController
  def create
    response = {}
    case params[:type]
    when 'process'
      process = Tramite.find params[:id]
      result = ExpedienteAdministrativo.create administrative_files_params.dup
      if result.created_at.present?
        render json: takeoff_nil_values(result.as_json)
      else
        render json: { errors: result.errors }, status: :forbidden
      end
    end
  end

  def index
    case params[:type]
    when 'process'
      process = Tramite.find params[:id]
      render json: process.expediente_administrativos.as_json
    end
  end

  private

  def takeoff_nil_values(json)
    json.each { |k, v| json[k] = '' if v.nil? }
  end

  def administrative_files_params
    params.require(:administrative_file).permit :nro_fojas, :nro_exp, :letra, :year
  end
end
