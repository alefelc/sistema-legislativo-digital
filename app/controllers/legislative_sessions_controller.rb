class LegislativeSessionsController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  def new
    @session = LegislativeSession.new
  end

  def create
    @session = LegislativeSession.new legislative_session_params
    if @session.save!
      flash[:success] = t '.success'
      respond_to do |format|
        format.html { redirect_to legislative_session_path(@session) }
        format.json { render json: @session.to_json(methods: :text) }
      end
    else
      flash.now[:error] = @session.errors.full_messages
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @session.to_json, status: :unprocessable_entity }
      end
    end
  end

  def show
    @session = LegislativeSession.find params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @session.to_json }
    end
  end

  def edit
    @session = LegislativeSession.find params[:id]
  end

  def update
    @session = LegislativeSession.find params[:id]
    if @session.update(legislative_session_params)
      flash[:success] = t('.success')
      redirect_to legislative_sessions_path
    else
      flash.now[:error] = @session.errors.full_messages
      render :edit
    end
  end

  private
  def legislative_session_params
    params.require(:legislative_session).permit :number, :observation, :session_type,
      :place, :secret, :started_at, :finished_at
  end

  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "number::text ilike ?"
      LegislativeSession.order(number: :desc).where(w, q).to_json only: :id, methods: :text
    else
      SessionDatatable.new view_context
    end
  end
end
