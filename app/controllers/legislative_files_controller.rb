class LegislativeFilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @loops = LegislativeFile.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: build_json }
    end
  end

  def new
    authorize LegislativeFile, :create?
    @loop = LegislativeFile.new
    @loop.loops.build number: 0
  end

  def create
    authorize LegislativeFile, :create?
    file = LegislativeFileService.new loop_create_params

    if file.save!
      flash[:success] = "Expediente creado correctamente"
      redirect_to file.instance
    else
      flash.now[:error] = file.errors
      @loop = file.instance
      render :new
    end
  end

  def edit
    authorize LegislativeFile, :update?
    @loop = LegislativeFile.find params[:id]
    @legislative_states = @loop.legislative_file_states
    @loop.loops.build number: @loop.loops.count
  end

  def update
    authorize LegislativeFile, :update?
    file = LegislativeFileService.new loop_update_params, params[:id]

    if file.update!
      flash[:success] = "Expediente actualizado correctamente"
      redirect_to file.instance
    else
      flash.now[:error] = file.errors
      @loop = file.instance
      render :edit
    end
  end

  def show
    @loop = LegislativeFile.find params[:id]
  end

  private

  def loop_create_params
    params.require(:legislative_file).permit :sheets, :topic,
      :observations, :accumulated_in, :year, :date,
      :origin_procedure_id, :physically_attached
  end

  def loop_update_params
    params.require(:legislative_file).permit :number, :sheets, :topic,
      :observations, :accumulated_in, :year, :date, :origin_procedure_id,
      :physically_attached, loops_attributes: [
        :id, :origin_procedure_id, :sheets, :date, :topic, :observations
      ]
  end

  def build_json
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "number ilike ?"
      LegislativeFile.where(w, q).order(id: :desc).limit(20).as_json only: :id, methods: :text
    else
      LegislativeFileDatatable.new(view_context)
    end
  end
end
