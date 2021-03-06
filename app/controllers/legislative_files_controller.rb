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
      @procedure_ids = Procedure.where id: loop_create_params[:origin_procedure_ids]
      render :index
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

  def print
    file = LegislativeFile.find params[:legislative_file_id]
    pdf = Prawn::LegislativeFile.new(file, view_context)
    send_data pdf.render, filename: "expediente_#{file.number}.pdf",
              type: 'application/pdf', disposition: 'inline'
  end

  def upload
    # check correct permissions here, and also delete if the request was made from current legislative_file
    upload = Upload.find params[:file_id]
    if upload.delete
      render json: { status: :ok, file: { id: upload.id} }
    else
      render json: { errors: upload.errors.full_messages }, status: :forbidden
    end
  end

  private

  def loop_create_params
    params.require(:legislative_file).permit :sheets, :topic,
      :observations, :accumulated_in, :year, :date, :physically_attached,
      uploads: [], origin_procedure_ids: []
  end

  def loop_update_params
    params.require(:legislative_file).permit :number, :sheets, :topic,
      :observations, :accumulated_in, :year, :date, :physically_attached,
      uploads: [], origin_procedure_ids: []
      # loops_attributes: [
      #   :id, :sheets, :date, :topic, :observations, origin_procedure_ids: []
      # ],
  end

  def build_json
    if params[:select_q].present?
      q = params[:select_q]
      w = "number::int = ?"
      if params[:select_q] == '%%'
        LegislativeFile.order("number::int desc").limit(20).as_json only: :id, methods: :text
      else
        LegislativeFile.where(w, q).as_json only: :id, methods: :text
      end
    else
      LegislativeFileDatatable.new(view_context)
    end
  end
end
