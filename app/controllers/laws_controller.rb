class LawsController < ApplicationController
  before_action :authenticate_user!

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  def new
    @law = Law.new
    @law.municipal_gazette = MunicipalGazette.new
  end

  def show
    @law = Law.find params[:id]
  end

  def edit
    @law = Law.find params[:id]
    @law.build_municipal_gazette
  end

  def upload
    # check correct permissions here, and also delete if the request was made from current legislative_file
    upload = Upload.find params[:file_id]
    if upload.delete
      flash[:success] = t '.success'
      redirect_to edit_law_path(params[:law_id])
    else
      flash[:error] = upload.errors.full_messages
      redirect_to edit_law_path(params[:law_id])
    end
  end

  def destroy
  end

  def create
    @law = Law.new law_params
    respond_to do |format|
      if @law.save
        @law.update uploads: params[:uploads], legislative_files: params[:legislative_file_ids]

        flash[:success] = t '.success'
        format.html { redirect_to edit_law_path(@law) }
        format.json { render json: @law.to_json }
      else
        flash.now[:error] = @law.errors.full_messages
        format.html { render :new }
        format.json { render json: @law.to_json, status: :unprocessable_entity }
      end
    end
  end

  def update
    @law = Law.find params[:id]
    respond_to do |format|
      if @law.update law_params
        @law.update uploads: params[:uploads]
        flash[:success] = t '.success'
        format.html { redirect_to edit_law_path(@law) }
        format.json { render json: @law.to_json }
      else
        flash.now[:error] = @law.errors.full_messages
        format.html { render :new }
        format.json { render json: @law.to_json, status: :unprocessable_entity }
      end
    end
  end

  private

  def law_params
    params.require(:law).permit :number, :letter, :year, :law_type,
      :communication_date, :legislative_session_id, :uploads,
      :enactment_decree, :enactment_decree_date, :enactment_decree_upload,
      municipal_gazette_attributes: [:number, :release_date, :upload]
  end

  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "number ilike ?"
      Law.where(w, q).to_json(only: :id, methods: :text)
    else
      LawsDatatable.new(view_context)
    end
  end
end
