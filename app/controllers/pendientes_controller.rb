class PendientesController < ApplicationController
  before_action :authenticate_user!

  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: PendienteDatatable.new(view_context) }
    end
  end
end
