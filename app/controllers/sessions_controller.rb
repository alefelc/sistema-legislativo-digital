class SessionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    respond_to do |format|
      format.html
      format.json { render json: SessionDatatable.new(view_context) }
    end
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new session_params
    if @session.save!
      flash[:success] = t '.success'
      redirect_to session_path(@session)
    else
      flash.now[:error] = @session.errors.full_messages
      render :new
    end
  end

  def show
    @session = Session.find params[:id]
  end

  def edit
    @session = Session.find params[:id]
  end

  def update
    @session = Session.find params[:id]
    if @session.update(session_params)
      flash[:success] = t('.success')
      redirect_to sessions_path
    else
      flash.now[:error] = @session.errors.full_messages
      render :edit
    end
  end

  private
  def session_params
    params.require(:session).permit :number, :observation, :session_type,
      :place, :secret, :started_at, :finished_at
  end
end
