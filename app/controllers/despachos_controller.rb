class DespachosController < ApplicationController
  respond_to :json, :html

  def index
    respond_to do |format|
      format.html
      format.json { render json: DespachoDatatable.new(view_context) }
    end
  end

  def new
    @despacho = Despacho.new
    respond_to do |format|
      format.html {render partial: "modal_despacho", locals: { actionvar: "create"}}
    end
  end

  def show
    @despacho = Despacho.find(params[:id])
  end

  def edit
    @despacho = Despacho.find(params[:id])
    respond_to do |format|
      format.html {render partial: "modal_despacho", locals: { actionvar: "update"}}
    end
  end

  def destroy
    Despacho.find(params[:id]).delete
    render json: {url: "/despachos"}
  end  

  def create
    desp = params[:despacho].select { |key, value| ["nro_fojas", "fecha", "observaciones"].include?(key) }
    @despacho = Despacho.create desp.to_hash

    ## get params comisions the POST
    comisions = params[:despacho][:comisions]
    unless comisions.blank?
      @despacho.comisions << Comision.where(id: comisions)
    end

    ## get params concejals the POST
    concejals = params[:despacho][:concejals]
    unless concejals.blank?
      @despacho.concejals << Concejal.where(id: concejals)
    end

    ## get params exps_ids the POST
    expedientes = params[:exps_ids]
    unless expedientes.blank?
      @despacho.expedientes << Expediente.where(id: expedientes)
    end

    redirect_to action: :index
  end

  def update
    desp = params[:despacho].select { |key, value| ["nro_fojas", "fecha","observaciones"].include?(key) }
    @despacho = Despacho.find(params[:id])
    

    @despacho.update desp.to_hash

    ## update params comisions the PATCH
    current_comisions = params[:despacho][:comisions]
    old_comisions = @despacho.comisions.map{ |x| x.id.to_s}
    associated_comisions = (current_comisions - old_comisions)
    @despacho.comisions << Comision.where(id: associated_comisions)
    clear_comisions = (old_comisions - current_comisions)
    @despacho.comisions.delete(Comision.where(id: clear_comisions))

    ## update params concejals the PATCH
    current_concejals = params[:despacho][:concejals]
    old_concejals = @despacho.concejals.map{ |x| x.id.to_s}
    associated_concejals = (current_concejals - old_concejals)
    @despacho.concejals << Concejal.where(id: associated_concejals)
    clear_concejals = (old_concejals - current_concejals)
    @despacho.concejals.delete(Concejal.where(id: clear_concejals))

    ## update params exps_ids the PATCH
    current_exps = params[:exps_ids].split(',')
    old_exps = @despacho.expedientes.map{ |x| x.id.to_s}
    associated_expedientes = (current_exps - old_exps)
    @despacho.expedientes << Expediente.where(id: associated_expedientes)
    clear_expedientes = (old_exps - current_exps)
    @despacho.expedientes.delete(Expediente.where(id: clear_expedientes))

    redirect_to action: :index
  end

  def search_exp
    expedientes = Expediente.where("CONCAT(nro_exp, bis, EXTRACT(year from anio)) ilike ?",
                                   "%#{params[:q]}%").order("nro_exp::int asc").first(15)
    render json: build_json_exp(expedientes)
  end

  private

  def despacho_params
    params.require(:despacho).permit("nro_fojas", "fecha",  "observaciones")
  end

  def build_json_exp exps
    json_array = []
    exps.each do |x|
      year = x.anio.present? ? x.anio.year.to_s : ""
      json_array << {
        id: x.id,
        indice: x.nro_exp + "/" + x.bis.to_s + "/" + year
      }
    end
    json_array
  end

end
