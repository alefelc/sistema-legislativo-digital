class DerivatedProceduresController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: ProcedureDerivationDatatable.new(view_context) }
    end
  end

  def create
  end

  def edit
  end

  def update
  end
end
