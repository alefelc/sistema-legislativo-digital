class CouncilorsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: CouncilorsDatatable.new(view_context) }
    end
  end

  def new
    @councilor = Concejal.new
  end

  def show
    @councilor = Concejal.find params[:id]
  end

  def edit
    @councilor = Concejal.find params[:id]
  end

  def create
    @councilor = Concejal.new councilors_params
    if @councilor.save
      flash[:success] = "Concejal cargado correctamente"
      redirect_to councilors_path
    else
      flash.now[:error] = @councilor.errors.full_messages
      render :new
    end
  end

  def update
    @councilor = Concejal.find params[:id]
    if @councilor.update councilors_params
      flash[:success] = "Concejal actualizado correctamente"
      redirect_to councilors_path
    else
      flash.now[:error] = @councilor.errors.full_messages
      render :edit
    end
  end

  private

  def councilors_params
    params.require(:councilor).permit :name, :surname, :cuit_or_dni, :phone,
                                      :email, :address, :bloque_id,
                                      :effective_time_from, :effective_time_to,
                                      :picture_file, :cv_file, :ddjj_file
  end
end
