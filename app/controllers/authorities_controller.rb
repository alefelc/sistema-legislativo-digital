class AuthoritiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @authorities = Authority.all.decorate
  end

  def new
    @authority = Authority.new
  end

  def edit
    @authority = Authority.find(params[:id]).decorate
  end

  def create
    @authority = Authority.new authority_params
    if @authority.save
      redirect_to authorities_path
    else
      flash[:error] = @authority.errors.full_messages
      render :new
    end
  end

  private
  def authority_params
    params.require(:authority).permit :periodo_id, :internal_position,
                                      :assumption_date, :recess_date, :person_id
  end
end
