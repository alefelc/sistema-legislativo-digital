class LegislativeFilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json }
    end
  end

  def new
    @loop = Loop.new
    @loop.legislative_file_states.build
  end

  def create
  end

  def edit
  end

  def update
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
