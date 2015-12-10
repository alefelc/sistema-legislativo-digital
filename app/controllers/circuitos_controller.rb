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

        ## add initial state
        circuito.estado_expedientes.create do |e|
            puts "crea estado inicial"
            e.tipo = 1
            e.nombre = "Iniciado"
            e.fecha = circuito.anio
        end          

        ## add states
        new_states = JSON.parse(params[:estados_circuito]).select{ |x, y| not y.has_key?(:id) }
        new_states.each do |key, value|
          circuito.estado_expedientes.create do |ne|
            ne.tipo = value['tipo']
            ne.fecha = value['fecha']
            case value['tipo']
            when 2
              # orden del dia
              ne.nombre = "Orden del Día"
              ne.especificacion1 = value['especificacion1']
            when 3
              # a comision
              ne.nombre = "A Comisión"
              ne.especificacion1 = value['especificacion1']
            when 5
              # sancionado
              ne.nombre = "Sancionado"
              ne.especificacion1 = value['especificacion1']
              ne.especificacion2 = value['especificacion2']
            when 7
              # retirado
              ne.nombre = "Retirado"
            else
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

        ## add states
        current_states = JSON.parse(params[:estados_circuito]).select{ |x, y| y.has_key?('id') }.map{ |x, y| y['id'] }
        new_states = JSON.parse(params[:estados_circuito]).select{ |x, y| not y.has_key?('id') }
        old_states = circuito.estado_expedientes.map{ |x| x.id }
        puts current_states
        puts "fin current"
        puts new_states
        puts "fin new"
        puts old_states
        puts "fin old"
        new_states.each do |key, value|
          puts "entro al new"
          circuito.estado_expedientes.create do |ne|
            ne.tipo = value['tipo']
            ne.fecha = value['fecha']
            case value['tipo']
            when 2
              # orden del dia
              ne.nombre = "Orden del Día"
              ne.especificacion1 = value['especificacion1']
            when 3
              # a comision
              ne.nombre = "A Comisión"
              ne.especificacion1 = value['especificacion1']
            when 5
              # sancionado
              ne.nombre = "Sancionado"
              ne.especificacion1 = value['especificacion1']
              ne.especificacion2 = value['especificacion2']
            when 7
              # retirado
              ne.nombre = "Retirado"
            else
            end
          end
        end
        puts (old_states - current_states)
        (old_states - current_states).each { |id| circuito.estado_expedientes.delete(id) }  
      end  
    end  

    redirect_to action: 'index', controller: 'expedientes'
  end

  private

  def pendiente_params
    params.require(:circuito).permit("fojas", "nro", "tema", "anio")
  end

end
