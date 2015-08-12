namespace :legacy_migrate do

  TAREAS = %w[
               particulares
               juridicas
               periodos
               concejales
               comisiones
               bloques
               repart_oficiales_depend_municipal
               expedientes
               expedientes_acumulados
               expedientes_adjuntados_fisicamente
               expedientes_administrativos
               estado_expediente
               digesto
               clasificacion
               ordenanza
               decretos
               resolucion
               declaraciones
               normas_especiales
               especiales_a_dispositivos
               ordenanzas_a_dispositivos
               decretos_a_dispositivos
               digesto_normas
               data_refactoring
             ]

  desc "Migración de particulares"
  task particulares: :environment do
    $estimated_time = Time.now
    puts "| - - - - - - - - - - - - - - - - - |"
    puts "| - Inicio de migración de datos- - |"
    puts "| - - - - - - - - - - - - - - - - - |\n"
  	# requerimos los modelos legacy
  	require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los particulares legacy
		LegacyPart.select(:NOMBRE, :APELLIDO, :TIPO_DOC, :NUM_DOC, :DOMICILIO).each do |part|
      print "."
  		p = Fisica.new
  		p.nombre = part.NOMBRE
  		p.apellido = part.APELLIDO
  		p.tipo_doc = part.TIPO_DOC
  		p.nro_doc	 = part.NUM_DOC
  		p.domicilio = part.DOMICILIO
  		p.save
  	end

    puts "\nFinalizada migración de particulares\n"
  end

  desc "Migración de concejales"
  task concejales: :environment do
  	# requerimos los modelos legacy
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los concejales legacy
    LegacyConcejal.all.each do |c|
      print "."
      p = create_concejal c
      find = Periodo.find_by_year(c.PERIODOD, c.PERIODOH)
      if find.empty?
        p.periodos.create do |per|
          per.desde = Date.new.change year: c.PERIODOD
          per.hasta = Date.new.change day: 31, month: 12, year: c.PERIODOH
        end
      else
        p.periodos << find
      end
    end

    puts "\nFinalizada migración de concejales\n"
  end

  desc "Migración de comisiones"
  task comisiones: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos las comisiones legacy
    LegacyComision.all.each do |com|
      print "."
      c_legadas = LegacyComision.where(CODIGO: com.CODIGO)
      c_actuales = Comision.where(codigo: com.CODIGO)
      if !c_legadas.empty? and c_actuales.count == 0
        c = Comision.create denominacion: com.DENOMINAC, codigo: com.CODIGO
        c_legadas.each { |cm| c.periodos << Periodo.find_by_year(cm.PERIODOD, cm.PERIODOH) }
      end
    end
    puts "\nFinalizada migración de comisiones\n"
  end

  desc "Migración de personas juridicas"
  task juridicas: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los particulares legacy
    LegacyJuridica.select(:DENOMINAC).each do |j|
      print "."
      Juridica.create nombre: j.DENOMINAC
    end

    puts "\nFinalizada migración de personas jurídicas\n"
  end

  desc "Migración de periodos"
  task periodos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los periodos legacy
    LegacyPeriodo.select(:PERIODOD, :PERIODOH).each do |periodo|
      Periodo.create do |p|
        print "."
        p.desde = Date.new.change year: periodo.PERIODOD
        p.hasta = Date.new.change day: 31, month: 12, year: periodo.PERIODOH
      end
    end

    puts "\nFinalizada migración de períodos\n"
  end

  desc "Migración de bloques"
  task bloques: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los bloques legacy
    LegacyBloque.all.each do |bloque|
      b = create_bloque bloque
      b.periodos << Periodo.find_by_year(bloque.PERIODOD, bloque.PERIODOH)
      LegacyConcejal.where(PARTIDO: bloque.CODIGO).each do |c|
        print "."
        Concejal.find_by(nombre: c.NOMBRE, apellido: c.APELLIDO).update_attribute :bloque, b
      end
    end

    puts "\nFinalizada migración de períodos\n"
  end

  desc "Migración de reparticiones oficiales y dependencias municipales"
  task repart_oficiales_depend_municipal: :environment do
  	# requerimos los modelos legacy
  	require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyReparticionOficial.select(:DENOMINAC).distinct.each do |x|
      print "."
      ReparticionOficial.create denominacion: x.DENOMINAC
    end

    puts "\nFinalizada migración de reparticiones oficiales\n"

    LegacyDependenciaMunicipal.select(:DENOMINAC).distinct.each do |x|
      print "."
      DependenciaMunicipal.create denominacion: x.DENOMINAC
    end

    puts "\nFinalizada migración de dependencias municipales\n"
  end

  desc "Migración de expedientes"
  task expedientes: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpediente.all.each do |e|
      print "."
      exp = Expediente.create nro_exp: e.NUM_EXPED, bis: e.BIS_EXPED, tema: e.TEMA, observacion: e.OBSERV
      find = LegacyTramite.find_by_ind(e.IND_EXP)
      if find.nil?
        date = Date.new.change year: e.ANO_EXPED
      else
        date = find.FECHA
      end
      exp.update_attribute :anio, date
      Circuito.create nro: 0, expediente: exp

      # creo circuitos correspondientes al expediente exp
      lt = LegacyTramite.where(B_EST: 1, IND_EXP: e.IND_EXP).order(:FECHA)
      i = 1

      while (i < lt.length) do
        if (lt[i-1].FECHA != lt[i].FECHA)
          Circuito.create nro: i, expediente: exp
        end
        i = i + 1
      end
    end

    puts "\nFinalizada migración de expediente\n"
  end

  desc "Migración de expedientes_acumulados"
  task expedientes_acumulados: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpediente.select(:ACUM, :ANO_EXPED, :BIS_EXPED, :NUM_EXPED).where("ACUM != 0").each do |e|
      print "."
      fe = LegacyExpediente.find_by_ind(e.ACUM)
      fe2 = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               fe.ANO_EXPED, fe.BIS_EXPED, fe.NUM_EXPED.to_s)
      exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               e.ANO_EXPED, e.BIS_EXPED, e.NUM_EXPED.to_s)
      fe2.acumulados << exp
    end

    puts "\nFinalizada migración de expedientes acumulados\n"
  end

  desc "Migración de expedientes adjuntados fisicamente"
  task expedientes_adjuntados_fisicamente: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpediente.select(:ADJFIS, :ANO_EXPED, :BIS_EXPED, :NUM_EXPED).where("ADJFIS != 0").each do |e|
      print "."
      fe = LegacyExpediente.find_by_ind(e.ADJFIS)
      fe2 = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               fe.ANO_EXPED, fe.BIS_EXPED, fe.NUM_EXPED.to_s)
      exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               e.ANO_EXPED, e.BIS_EXPED, e.NUM_EXPED.to_s)
      fe2.acumulados << exp
    end

    puts "\nFinalizada migración de expedientes acumulados\n"
  end

  desc "Migración de expedientes administrativos"
  task expedientes_administrativos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpedienteAdministrativo.select(:IND_EXP, :NUMEROEA, :LETRAEA, :SUBEA, :ANOEA).each do |e|
      print "."
      date = Date.new.change year: e.ANOEA unless e.ANOEA.zero?
      ea = ExpedienteAdministrativo.create nro_exp: e.NUMEROEA, letra: e.LETRAEA, sub_indice: e.SUBEA, anio: date
      ind = parse_ind_exp e.IND_EXP.to_s
      exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               ind[:anio], ind[:bis], ind[:exp].to_s)
      if exp.nil?
        puts "soy nil #{e.IND_EXP}"
      else
        exp.expediente_administrativos << ea
      end
    end

    puts "\nFinalizada migración de expediente administrativos\n"
  end

  desc "Migración de estados expedientes (TRAMITE)"
  task estado_expediente: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyTramite.all.each do |t|
      print "."
      ind = parse_ind_exp t.IND_EXP.to_s
      exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               ind[:anio], ind[:bis], ind[:exp].to_s)
      if exp.present?
        ee = EstadoExpediente.create nombre: t.ESTADO,
          especificacion1: t.ESPECIF1, especificacion2: t.ESPECIF2,
          tipo: t.B_EST, fecha: t.FECHA
        exp.circuitos[0].estado_expedientes << ee
      else
        puts "Soy nil! #{t.IND_EXP}"
      end
    end
    puts "\nMigración de estados de expedientes finalizada\n"
  end

  desc "Carga de la estructura del digesto"
  task digesto: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    d = Digesto.create nombre: "Digesto Version 1"

    LegacyDigesto.select(:TEXLIBRO,:LIBRO).distinct.each do |l|
      unless l.TEXLIBRO.blank?
        print "."
        lib = Libro.create nombre: l.TEXLIBRO, orden: l.LIBRO
        d.libros << lib
        LegacyDigesto.select(:TEXTIT,:TITULO).where(TEXLIBRO: l.TEXLIBRO).distinct.each do |t|
          unless t.TEXTIT.blank?
            print "."
            tit = Titulo.create nombre: t.TEXTIT, orden: t.TITULO
            lib.titulos << tit
            LegacyDigesto.select(:TEXCAP,:CAPITULO).where(TEXTIT: t.TEXTIT).distinct.each do |c|
              unless c.TEXCAP.blank?
                print "."
                cap = Capitulo.create nombre: c.TEXCAP, orden: c.CAPITULO
                tit.capitulos << cap
              end
            end
          end
        end
      end
    end
    puts "\nFinalizada carga de estructura del digesto\n"
  end

  desc "Carga de las clasificaciones"
  task clasificacion: :environment do
    ## Ordenanza - Contenido
    Clasificacion.create nombre: "General"
    Clasificacion.create nombre: "Individual y meros actos administrativos"
    Clasificacion.create nombre: "De Servicios Públicos"
    Clasificacion.create nombre: "Otras"
    Clasificacion.create nombre: "Alcance general"
    Clasificacion.create nombre: "Alcance especial"
    ## Ordenanza - Vigencia
    Clasificacion.create nombre: "Dictada por razones de emergencia"
    Clasificacion.create nombre: "Que contienen normas generales y permanentes"
    Clasificacion.create nombre: "Que NO contienen normas generales y permanentes"
    Clasificacion.create nombre: "Motivos subsisten"
    Clasificacion.create nombre: "Normas generales"
    Clasificacion.create nombre: "Normas no generales"
    Clasificacion.create nombre: "Plazo determinado y cumplido"
    Clasificacion.create nombre: "Plazo determinado y NO cumplido"
    Clasificacion.create nombre: "Vigencia sujeta a condición resolutoria"
    Clasificacion.create nombre: "Objeto agotado"
    Clasificacion.create nombre: "Cumplida"
    Clasificacion.create nombre: "NO cumplida"
    # Ordenanza - Derog.
    Clasificacion.create nombre: "Derogación sujeta a condición suspensiva"
    Clasificacion.create nombre: "Derog. tácita"
    Clasificacion.create nombre: "Derog. cumplida"
    Clasificacion.create nombre: "Derog. NO cumplida"
    # Ordenanza - Modif.
    Clasificacion.create nombre: "Dispone texto ordenado"
    ## Decreto - Contenido
    Clasificacion.create nombre: "Autónomo"
    # Clasificacion.create nombre: "Individual y meros actos administrativos"
    # Clasificacion.create nombre: "De servicios públicos"
    # Clasificacion.create nombre: "Otras"
    # Clasificacion.create nombre: "Alcance general"
    # Clasificacion.create nombre: "Alcance especial"
    # Decreto - vigencia
    Clasificacion.create nombre: "De necesidad o urgencia"
    Clasificacion.create nombre: "Dictado ad referendum"
    # Clasificacion.create nombre: "Que contienen normas generales y permanentes"
    # Clasificacion.create nombre: "Que NO contienen normas generales y permanentes"
    # Clasificacion.create nombre: "Motivos subsisten"
    # Clasificacion.create nombre: "Normas generales"
    # Clasificacion.create nombre: "Normas no generales"
    # Clasificacion.create nombre: "Plazo determinado y cumplido"
    # Clasificacion.create nombre: "Plazo determinado y NO cumplido"
    # Clasificacion.create nombre: "Vigencia sujeta a condición resolutoria"
    # Clasificacion.create nombre: "Objeto agotado"
    # Clasificacion.create nombre: "Cumplida"
    # Clasificacion.create nombre: "NO cumplida"
    # Decreto - derog.
    # Clasificacion.create nombre: "Derogación sujeta a condición suspensiva"
    # Clasificacion.create nombre: "Derog. tácita"
    # Clasificacion.create nombre: "Derog. cumplida"
    # Clasificacion.create nombre: "Derog. NO cumplida"
    # Decreto - modif.
    # Clasificacion.create nombre: "Dispone texto ordenado"
    puts "\nFinalizada carga de clasificaciones de las normas\n"
  end

  desc "Carga de las ordenanzas"
  task ordenanza: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
    LegacyOrdenanza.all.each do |o|
      print ";"
      ord = Ordenanza.create letra: o.LETRA_ORD, nro: o.NUM_ORD, bis: o.BIS_ORD, anio: o.ANO_ORD,
          sumario: o.SUMARIO, observaciones: o.OBSERV, sancion: o.FECSORD, entrada_vigencia: o.FEC_VIGE,
          finaliza_vigencia: o.FEC_VIGF, indice: o.IND_ORD
      #cargo plazo vigencia
      if o.PLZVD == 1
        ord.plazo_dia = o.PLNUM
      elsif o.PLZVM == 1
        ord.plazo_mes = o.PLNUM
      elsif o.PLZVA == 1
        ord.plazo_anio = o.PLNUM
      end

      # cargo clasificaciones a las ordenanzas
        ord.clasificacions << Clasificacion.find_by(nombre: "General") if o.CGEN == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Individual y meros actos administrativos") if o.CPIND == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "De Servicios Públicos") if o.CPCCSP == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Otras") if o.CPCCOT == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Alcance general") if o.CALCGEN == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Alcance especial") if o.CALCESP == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Dictada por razones de emergencia") if o.VDREMERG == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Motivos subsisten") if o.VDREMOTS == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Normas generales") if o.VDREMNG == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Normas no generales") if o.VDREMNNG == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Que contienen normas generales y permanentes") if o.VDRPQC == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Que NO contienen normas generales y permanentes")  if o.VDRPQNC == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Plazo determinado y cumplido") if o.VPLZDYC == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Plazo determinado y NO cumplido") if o.VPLZDYNC  == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Vigencia sujeta a condición resolutoria") if o.VSUJCR == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Cumplida") if o.VSUJCRC == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "NO cumplida") if o.VSUJCRNC == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Objeto agotado") if o.OBJ_AGOT == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Derog. tácita") if o.DEROGTAC == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Derogación sujeta a condición suspensiva") if o.DSUJACS == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Derog. cumplida") if o.DSJCUMP == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Derog. NO cumplida") if o.DSJNCUMP == 1
        ord.clasificacions << Clasificacion.find_by(nombre: "Dispone texto ordenado") if o.MDISTXTO == 1

      # cargo relacion ordenanza con su expediente
      unless o.IND_EXP.zero?
        ind = parse_ind_exp o.IND_EXP.to_s
        exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               ind[:anio], ind[:bis], ind[:exp].to_s)
        if exp.present?
          ord.circuitos << exp.circuitos.find_by(nro: 0)
        else
          puts "Soy ecxpediente nil! #{o.IND_EXP}"
        end
      end

      # creo y cargo decreto de promulgacion de las ordenanzas
      if !o.OBSERV.scan(/.*PROMUL.*CITA.*/).empty?
        #creo relacion promul tacita pero sin decreto
        ord.relationship_me_promulgan.create do |r|
          r.tipo = 1
          r.observacion = o.OBSERV
        end
      elsif (p = !o.NUM_DEC.zero?) || (q = !o.IND_DAUX.zero?)
        #creo decrto y relacion de promulgacion
        if q
          ind = parse_ind_norma o.IND_DAUX.to_s
          dec = Decreto.create sancion: o.FECSDEC, letra: o.LETRA_DEC, nro: ind[:norma], bis: ind[:bis], indice: o.IND_DAUX
          ord.relationship_me_promulgan.create do |r|
            r.me_promulga = dec
            r.desde = o.FECSDEC
          end
        elsif p
          dec = Decreto.create sancion: o.FECSDEC, letra: o.LETRA_DEC, nro: o.NUM_DEC, bis: o.BIS_DEC, indice: o.IND_DAUX
          ord.relationship_me_promulgan.create do |r|
            r.me_promulga = dec
            r.desde = o.FECSDEC
          end
        end
      end

      # carga de comunicacion
      unless o.ACOM_DEM.nil?
        dest = Destino.create tipo: 0, fecha: o.ACOM_DEM
        ord.destinos << dest
      end
      # carga de notificacion
      unless o.ADEST_NOT.blank?
        dest = Destino.create tipo: 1, fecha: o.AFEC_NOT, destino: o.ADEST_NOT
        ord.destinos << dest
      end
      ord.save
    end
    puts "\nFinalizada carga de Ordenanzas\n"
  end

  desc "Carga de decretos"
  task decretos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyDecreto.all.each do |d|
      dec = Decreto.create(letra: d.LETRA_DEC, nro: d.NUM_DEC, bis: d.BIS_DEC, sumario: d.SUMARIO,
            observaciones: d.OBSERV, entrada_vigencia: d.FEC_VIGE, finaliza_vigencia: d.FEC_VIGF,
            sancion: d.FECSDEC, indice: d.IND_D)

      if !d.PLZVD.zero?
        dec.plazo_dia = d.PLNUM
      elsif !d.PLZVM.zero?
        dec.plazo_mes = d.PLNUM
      elsif
        dec.plazo_anio = d.PLNUM
      end

        # cargo clasificaciones

      dec.clasificacions << Clasificacion.find_by(nombre: "Autónomo") if d.CGENAU == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Individual y meros actos administrativos") if d.CPIND == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "De Servicios Públicos") if d.CPCCSP == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Otras") if d.CPCCOT == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Alcance general") if d.CALCGEN == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Alcance especial") if d.CALCESP == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "De necesidad o urgencia") if d.VDNEOUR == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Motivos subsisten") if d.VDREMOTS == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Normas generales") if d.VDREMNG == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Normas no generales") if d.VDREMNNG == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Que contienen normas generales y permanentes") if d.VDRPQC == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Que NO contienen normas generales y permanentes") if d.VDRPQNC == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Plazo determinado y cumplido") if d.VPLZDYC == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Plazo determinado y NO cumplido") if d.VPLZDYNC  == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Vigencia sujeta a condición resolutoria") if d.VSUJCR == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Cumplida") if d.VSUJCRC == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "NO cumplida") if d.VSUJCRNC == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Objeto agotado") if d.OBJ_AGOT == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Derog. tácita") if d.DEROGTAC == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Derogación sujeta a condición suspensiva") if d.DSUJACS == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Derog. cumplida") if d.DSJCUMP == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Derog. NO cumplida") if d.DSJNCUMP == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Dispone texto ordenado") if d.MDISTXTO == 1
      dec.clasificacions << Clasificacion.find_by(nombre: "Dictado ad referendum") if d.ADREFE == 1

      dec.save
    end
    puts "\nFinalizada carga de Decretos\n"
  end

  desc "Carga de resoluciones"
  task resolucion: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyResolucion.all.each do |r|
      print '.'
      res = Resolucion.create(nro: r.NUM_RES, bis: r.BIS_RES, sumario: r.SUMARIO, observaciones: r.OBSERV,
            sancion: r.FEC_SANC, anio: r.ANO_RES, indice: r.IND_RES)
      # carga de comunicacion
      unless r.DEST_COM.blank?
        dest = Destino.create tipo: 0, fecha: r.COMUNIC, destino: r.DEST_COM
        res.destinos << dest
      end
      # carga de notificacion
      unless r.DEST_NOT.blank?
        dest = Destino.create tipo: 1, fecha: r.NOTIFIC, destino: r.DEST_NOT
        res.destinos << dest
      end
      # cargo relacion resolucion con su expediente
      unless r.IND_EXP.zero?
        ind = parse_ind_exp r.IND_EXP.to_s
        exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               ind[:anio], ind[:bis], ind[:exp].to_s)
        if exp.present?
          res.circuitos << exp.circuitos.find_by(nro: 0)
        else
          puts "Soy ecxpediente nil! #{r.IND_EXP}"
        end
      end
    end
    puts "\nFinalizada carga de Resolucion\n"
  end

  desc "Carga de declaraciones"
  task declaraciones: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyDeclaracion.all.each do |d|
      print '.'
      decl = Declaracion.create(nro: d.NUM_CLA, bis: d.BIS_CLA, sumario: d.SUMARIO, observaciones: d.OBSERV,
                              sancion: d.FECSCLA, anio: d.ANO_CLA)
      # carga de comunicacion
      unless d.DEST_COM.blank?
        dest = Destino.create tipo: 0, fecha: d.COMUNIC, destino: d.DEST_COM
        decl.destinos << dest
      end
      # carga de notificacion
      unless d.DEST_NOT.blank?
        dest = Destino.create tipo: 1, fecha: d.NOTIFIC, destino: d.DEST_NOT
        decl.destinos << dest
      end
      # cargo relacion declaracion con su expediente
      unless d.IND_EXP.zero?
        ind = parse_ind_exp d.IND_EXP.to_s
        exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                                 ind[:anio], ind[:bis], ind[:exp].to_s)
        if exp.present?
          decl.circuitos << exp.circuitos.find_by(nro: 0)
        else
          puts "Soy expediente nil! #{d.IND_EXP}"
        end
      end
    end
    puts "\nFinalizada carga de declaraciones\n"
  end

  desc "Carga de normas especiales"
  task normas_especiales: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyNormaEspecial.all.each do |e|
      print '.'
      esp = Especial.create(nro: e.NUM_E, descripcion: e.DESCRIP, sumario: e.SUMARIO, observaciones: e.OBSERV,
                              sancion: e.FEC_SANC, tipo: e.TIPO_E, bis: 0, anio: e.ANO_E, indice: e.IND_E)
      if !e.FEC_PROM.nil?
        esp.relationship_me_promulgan.create do |r|
          r.desde = e.FEC_PROM
        end
      end
      esp.clasificacions << Clasificacion.find_by(nombre: "Dispone texto ordenado") if e.MDISTXTO == 1
    end
    puts "\nFinalizada carga de normas especiales\n"
  end

  desc "Carga de normas especiales a dispositivos"
  task especiales_a_dispositivos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyEspecialADispositivo.all.each do |e|
      print '.'
      ind_base = parse_ind_norma e.IND_B.to_s
      ind_ref = parse_ind_norma e.IND_R.to_s
      esp_base = Especial.find_by("EXTRACT(year FROM sancion) = ? AND bis = ? AND nro = ?",ind_base[:anio], ind_base[:bis],ind_base[:norma])
      esp_ref = Especial.find_by("EXTRACT(year FROM sancion) = ? AND bis = ? AND nro = ?",ind_ref[:anio], ind_ref[:bis],ind_ref[:norma])
      if esp_base.present? && esp_ref.present?
        esp_ref.me_modifican << esp_base
      else
        puts "base o referencia es nil: #{e.IND_B} modifica #{e.IND_R}"
      end
    end
    puts "\nFinalizada carga de normas especiales a dispositivos\n"
  end

  # ATENTION!!!!!!!!
  # Cuando se cree la tarea de eliminar ordenanzas duplicadas, realizarla antes de la tarea de carga de ordenanzas
  # ATENTION!!!!!!!!
  desc "Carga de ordenanzas a dispositivos"
  task ordenanzas_a_dispositivos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyOrdenanzaADispositivo.all.each do |o|
      print '.'
      #ind_base = parse_ind_ord o.IND_B.to_s
      ord_base = Ordenanza.find_by(indice: o.IND_B)
      if o.IND_R.to_s.length == 10
        #ind_ref = parse_ind_ord o.IND_R.to_s
        norm_ref = Ordenanza.find_by(indice: o.IND_R)
      else
        #ind_ref = parse_ind_norma o.IND_R.to_s
        norm_ref = Decreto.find_by(indice: o.IND_R)
      end
      # cargo relaciones
      if ord_base.present? && norm_ref.present?
          norm_ref.me_modifican << ord_base if o.CODREFER == "modif"
          norm_ref.me_prorrogan_suspension << ord_base if o.CODREFER == "prorrog"
          norm_ref.me_prorrogan_vigencia << ord_base if o.CODREFER == "provig"
          norm_ref.me_restituyen_vigencia << ord_base if o.CODREFER == "restiv"
          norm_ref.me_suspenden_vigencia << ord_base if o.CODREFER == "suspvig"
          norm_ref.me_derogan << ord_base if o.CODREFER == "derog"
          norm_ref.me_aclaran << ord_base if o.CODREFER == "aclarac"
          norm_ref.tiene_ad_referendum << ord_base if o.CODREFER == "adrefe"
      else
        puts "base o referencia es nil: #{o.IND_B} modifica #{o.IND_R}\n"
      end
    end
    puts "\nFinalizada carga de ordenanzas a dispositivos\n"
  end

  desc "Carga de decretos a dispositivos"
  task decretos_a_dispositivos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyDecretoADispositivo.all.each do |d|
      print '.'
      #ind_base = parse_ind_ord o.IND_B.to_s
      dec_base = Decreto.find_by(indice: d.IND_B)
      if d.IND_R.to_s.length == 10
        #ind_ref = parse_ind_ord o.IND_R.to_s
        norm_ref = Ordenanza.find_by(indice: d.IND_R)
      else
        #ind_ref = parse_ind_norma o.IND_R.to_s
        norm_ref = Decreto.find_by(indice: d.IND_R)
      end
      # cargo relaciones
      if dec_base.present? && norm_ref.present?
          norm_ref.me_modifican << dec_base if d.CODREFER == "modif"
          norm_ref.me_prorrogan_suspension << dec_base if d.CODREFER == "prorrog"
          norm_ref.me_prorrogan_vigencia << dec_base if d.CODREFER == "provig"
          norm_ref.me_restituyen_vigencia << dec_base if d.CODREFER == "restiv"
          norm_ref.me_suspenden_vigencia << dec_base if d.CODREFER == "suspvig"
          norm_ref.me_derogan << dec_base if d.CODREFER == "derog"
          norm_ref.me_aclaran << dec_base if d.CODREFER == "aclarac"
          norm_ref.me_delegan << dec_base if d.CODREFER == "delegado"
          norm_ref.me_reglamentan << dec_base if d.CODREFER == "reglamen"
          norm_ref.me_vetan_parcialmente << dec_base if d.CODREFER == "vetop"
          norm_ref.me_vetan_totalmente << dec_base if d.CODREFER == "vetot"
      else
        puts "base o referencia es nil: #{d.IND_B} modifica #{d.IND_R}\n"
      end
    end
    puts "\nFinalizada carga de decretos a dispositivos\n"
  end

  ## ELIMINAR RESOLUCIONES REPETIDAS!! VERIFICAR RESOL Y NORMESP
  desc "Carga de normas a digesto"
  task digesto_normas: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyNormaDigesto.all.each do |n|
      print '.'
      norma = Norma.find_by indice: n.CODIGO_N
      lib = Libro.find_by orden: n.LIBRO
      tit = lib.titulos.find_by orden: n.TITULO
      cap = tit.capitulos.find_by orden: n.CAPITULO
      if cap.nil?
        puts "NO SE PUDO ENCONTRAR CAPITULO #{n.UBIC}"
      else
        norma.capitulos_normas.create capitulo_id: cap.id, orden: n.ORDEN
      end
    end
  end

  ### QUEDAN PENDIENTES!!!
  # SANCIONE.sql = Estos estados no seran manejados desde la DB.
  # DIA.sql - ASE.sql (Son iguales) + los datos del lalo.

  desc "Refactorizacion de datos"
  task data_refactoring: :environment do
    puts "| - - - - - - - - - - - - - - - - - - |"
    puts "| - Migración de datos FINALIZADA - - |"
    puts "| - - - - - - - - - - - - - - - - - - |\n"
    puts "Tiempo estimado #{ Time.now - $estimated_time }s"
  end

  desc "ejecutar todas las tareas"
  task :tareas => TAREAS

  private
  def concejal_exists? concej
    Concejal.where(nombre: concej.NOMBRE, apellido: concej.APELLIDO).present?
  end

  def bloque_exists? bloque
    Bloque.where(codigo: bloque.CODIGO).present?
  end

  def create_concejal concej
    if concejal_exists? concej
      Concejal.find_by nombre: concej.NOMBRE, apellido: concej.APELLIDO
    else
      Concejal.create do |x|
        x.nombre = concej.NOMBRE
        x.apellido = concej.APELLIDO
      end
    end
  end

  def create_bloque bloque
    if bloque_exists? bloque
      Bloque.find_by codigo: bloque.CODIGO
    else
      Bloque.create denominacion: bloque.DENOMINAC, codigo: bloque.CODIGO
    end
  end

  def parse_ind_exp ind_exp
    {
      anio: ind_exp[0..3],
      exp: ind_exp[4..-2].to_i,
      bis: ind_exp.last.to_i
    }
  end

  def build_index(nro_exp, bis, anio)
    anio.year.to_s + nro_exp.to_s.rjust(5,"0") + bis.to_s
  end

  def parse_ind_norma ind_norma
    {
      anio: ind_norma[1..4],
      norma: ind_norma[5..-2].to_i,
      bis: ind_norma.last.to_i
    }
  end

  def parse_ind_ord ind_ord
    {
      anio: ind_ord[0..3],
      ord: ind_ord[4..-2].to_i,
      bis: ind_ord.last.to_i
    }
  end
end
