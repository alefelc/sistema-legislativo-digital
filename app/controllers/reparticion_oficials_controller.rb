class ReparticionOficialsController < ApplicationController
  respond_to :json, :html

  def create
    repart = params[:reparticion]
    @reparticion = ReparticionOficial.create repart.to_hash

    render :json => { 
      :status => :ok, 
      :message => "Success!",
      :iniciador => @reparticion.as_json(methods: 'type' )
    }.to_json
  end

  def update
    repart = params[:reparticion]

    @reparticion = ReparticionOficial.find(params[:id])
    @reparticion.update repart.to_hash

    render :json => { 
      :status => :ok, 
      :message => "Success!",
      :iniciador => @reparticion.as_json(methods: 'type' )
    }.to_json
  end 

  private

  def reparticions_params
    params.require(:reparticion).permit("type", "denominacion")
  end

end
