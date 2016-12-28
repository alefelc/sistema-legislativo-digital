class LegislativeFilesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json }
    end
  end

  private

  def build_json
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "nro_exp ilike ?"
      LegislativeFile.where(w, q).as_json only: :id, methods: :text
    end
  end
end
