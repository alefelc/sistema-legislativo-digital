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

  def dictamen_type(desp, exps)
    if exps.present?
      EstadoExpediente.find_by(
        ref_id: desp.id,
        ref_type: desp.type,
        circuito_id: exps.first.circuitos.find_by(nro: 0).id
      ).try(:especificacion2)
    end
  end

  def day_options
    (1..31).map { |x| [x, x] }
  end

  def month_options(current_month=nil)
    options_for_select([
      ["Enero", 1],
      ["Febrero", 2],
      ["Marzo", 3],
      ["Abril", 4],
      ["Mayo", 5],
      ["Junio", 6],
      ["Julio", 7],
      ["Agosto", 8],
      ["Septiembre", 9],
      ["Octubre", 10],
      ["Noviembre", 11],
      ["Diciembre", 12]
    ], current_month)
  end

  def year_options
    (1990..Date.current.year).map { |x| [x, x] }.reverse
  end
end
