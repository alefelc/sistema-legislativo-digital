module LegislativeFileStatesHelper
  def states_types
    options_for_select [
      %w(Parlamentario parliamentary),
      %w(Administrativo administrative),
      %w(Comisión comision)
    ]
  end

  def sancion_options1
    options_for_select [
      ["Aprob. Art. 151 R.I.","Aprob. Art. 151 R.I."],
      ["Aprob. S/T c/desp.","Aprob. S/T c/desp."],
      ["Aprob. S/T s/desp.","Aprob. S/T s/desp."],
      ["Aprobado","Aprobado"],
      ["Arch. S/T c/desp.","Arch. S/T c/desp."],
      ["Arch. S/T s/desp.","Arch. S/T s/desp."],
      ["Archivado","Archivado"],
      ["Decision Acuerdo","Decision Acuerdo"],
      ["Decisión Art. 71","Decisión Art. 71"],
      ["Rech. S/T c/desp.","Rech. S/T c/desp."],
      ["Rech. S/T s/desp.","Rech. S/T s/desp."],
      ["Rechazado","Rechazado"],
      ["Retirado","Retirado"]
    ]
  end

  def sancion_options2
    options_for_select [
      ["Aprob. Simple","Aprob. Simple"],
      ["1° Lectura","1° Lectura"],
      ["2° Lectura","2° Lectura"]
    ]
  end

  def session_number(state)
    options_for_select [
      [state.session, state.session_id]
    ]
  end

  def state_comisions(state)
    comisions = state.comisions.map {|c| [c.text, c.id]}
    options_for_select comisions
  end
end
