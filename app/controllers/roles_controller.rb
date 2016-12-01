class RolesController < ApplicationController
  def index
    authorize :configurations, :all?
    @roles = Role.all
    respond_to do |format|
      format.html
      format.json { render json: build_json_response }
    end
  end

  def new
    authorize :configurations, :all?
    @role = Role.new
  end

  def create
    authorize :configurations, :all?
    @role = Role.new roles_params
    if @role.save
      flash.now[:success] = t('.success')
      render :index
    else
      flash.now[:error] = @role.errors.full_messages
      render :new
    end
  end

  def edit
    authorize :configurations, :all?
    @role = Role.find params[:id]
  end

  def update
    authorize :configurations, :all?
    @role = Role.find params.dup[:id]
    if @role.update(roles_params)
      flash.now[:success] = t('.success')
      redirect_to roles_path
    else
      flash.now[:error] = @role.errors.full_messages
      render :edit
    end
  end

  private

  def build_json_response
    if params[:select_q].present?
      q = "%#{params[:select_q]}%"
      w = "name ilike ?"
      Role.where(w, q).to_json(only: [:id], methods: :text)
    end
  end

  def roles_params
    params.require(:role).permit :name, activities: []
  end
end
