class SignatorsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  def create
    if params[:name].blank? && params[:surname].blank? && params[:position].blank? &&
      params[:contact_info].blank?
      return render json: { status: :ok }
    end
    signatory = ProcedureSignatory.create signator_params

    render json: signatory.to_json(methods: :text)
  end

  def edit
    @signatory = ProcedureSignatory.find(params[:id]).decorate
  end

  def update
    @signatory = ProcedureSignatory.find params[:id]
    if @signatory.update signator_params
      flash[:success] = t '.success'
      redirect_to signators_path
    else
      flash.now[:error] = @signatory.errors.full_messages
      render :new
    end
  end

  private

  def signator_params
    params.require(:procedure_signatory).permit :name, :surname, :position, :contact_info, :initiator_type, :leave_date
  end

  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "(surname ilike ? OR name ilike ?) AND initiator_type = ? AND leave_date IS NULL"
      type = ProcedureSignatory.initiator_types[params[:initiator_type].to_sym]
      ProcedureSignatory.where(w, q, q, type).to_json only: :id, methods: :text
    else
      SignatorsDatatable.new(view_context)
    end
  end
end
