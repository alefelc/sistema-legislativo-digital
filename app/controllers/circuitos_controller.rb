class CircuitosController < ApplicationController
  before_action :authenticate_usuario!

  respond_to :json, :html

  def update
    c = params[:circuitos]
    expediente = Expediente.find(params[:expediente])
    if c.present?
      if ( c == "nuevo")
        ## caso de crear nuevo circuito
        circuito = Circuito.create params[:circuito].to_hash
        expediente.circuitos << circuito

        ##add relation circuit and tramites
        unless params[:tramites_pendientes].blank?
          JSON.parse(params[:tramites_pendientes]).each do |key, value|
            tramite = Tramite.find(value["id"])
            circuito.tramites << tramite

            #set finalized state to tramite
            tramite.estado_tramites.create do |e|
              e.nombre = "Finalizado"
              e.tipo = 3
              e.especificacion = "Circuito Nro: " + circuito.nro.to_s
              e.ref_id = expediente.id
              e.ref_type = expediente.type
            end
          end
        end
      else
        ## caso del update del circuito
        circuito = Circuito.find(c)
        circuito.update params[:circuito].to_hash

        current_tramites = []
        old_tramites = circuito.tramites.map{ |x| x.id }
        JSON.parse(params[:tramites_pendientes]).each do |key, value|
          unless old_tramites.include?(value["id"])
            tramite = Tramite.find(value["id"])
            circuito.tramites << tramite

            #set finalized state to tramite
            tramite.estado_tramites.create do |e|
              e.nombre = "Finalizado"
              e.tipo = 3
              e.especificacion = "Circuito Nro: " + circuito.nro.to_s
              e.ref_id = expediente.id
              e.ref_type = expediente.type
            end
          end
          current_tramites << value["id"]
        end

        # delete tramites and final state
        (old_tramites - current_tramites).each do |id| 
          circuito.tramites.delete(id)
          tramite = Tramite.find(id)
          tramite.estado_tramites.find_by(ref_id: expediente.id, tipo: "3").delete
          tramite.pendiente = true
          tramite.save
        end  
      end  
    end  

    redirect_to action: 'index', controller: 'expedientes'
  end

  private

  def pendiente_params
    params.require(:circuito).permit("fojas", "nro", "tema", "anio")
  end

end
