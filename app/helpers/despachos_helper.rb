module DespachosHelper

  def despacho_expedientes(desp)
    resp = ""
    desp.expedientes.each do |e|
      resp = resp + link_to(e.nro_exp.to_s, "expedientes/#{e.id}") + " - "
    end
    resp[0..-3]
  end

  def get_options_comisions
    Periodo.last.comisions.order(:denominacion).collect{|c| [c.denominacion, c.id]}
  end

  def get_options_concejals
    Periodo.last.concejals.order(:apellido, :nombre).collect{|c| [c.apellido + ", " + c.nombre, c.id]}
  end
end
