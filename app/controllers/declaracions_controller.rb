class DeclaracionsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: DeclaracionDatatable.new(view_context) }
    end
  end

end
