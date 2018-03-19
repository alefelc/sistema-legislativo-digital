class LoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: [:edit, :update]

  def index
    @loans = Loan.all
  end

  def pendants
    @loans = Loan.pendant_files
  end

  def new
    @loan = Loan.new person: Fisica.new
  end

  def edit
  end

  def create
    @loan = Loan.new loan_params
    if @loan.save
      flash[:success] = "PRÉSTAMO CARGADO CORRECTAMENTE"
      redirect_to pendant_loans_path
    else
      flash.now[:error] = @loan.errors.full_messages
      render :new
    end
  end

  def update
    if @loan.update(returned_at: DateTime.current)
      render json: @loan.to_json
    else
      render json: { error: @loan.errors.full_messages }, status: 401
    end
  end

  def persons
    q = "%#{params[:select_q]}%"
    w = "concat(surname, ' ', name) ilike ? or "
    w += "concat(name, ' ', surname) ilike ? or "
    w += "cuit_or_dni ilike ?"
    render json: Fisica.where(w, q, q, q).to_json(only: :id, methods: :text)
  end

  private

  def loan_params
    params.require(:loan).permit :legislative_file_id, :borrowed_at, :person_id
  end

  def set_loan
    @loan = Loan.find_by id: params[:id]
  end
end
