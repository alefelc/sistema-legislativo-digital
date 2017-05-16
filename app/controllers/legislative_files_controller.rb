class LegislativeFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @loops = LegislativeFile.all
    respond_to do |format|
      format.html
      format.json { render json: build_json }
    end
  end

  def new
    @loop = LegislativeFile.new
    @loop.legislative_file_states.build
  end

  def create
    @loop = LegislativeFile.create loop_params
    redirect_to @loop
  end

  def edit
    @loop = LegislativeFile.find params[:id]
    @loop.legislative_file_states.build
  end

  def update
    @loop = LegislativeFile.find params[:id]
    @loop.legislative_file_states.build
  end

  def show
    @loop = LegislativeFile.find params[:id]
  end

  private

  def loop_params
    params.require(:loop).permit :number, :nro_fojas, :bis, :tema, :observacion, :anio
  end

  def build_json
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "number ilike ?"
      LegislativeFile.where(w, q).as_json only: :id, methods: :text
    end
  end
end
