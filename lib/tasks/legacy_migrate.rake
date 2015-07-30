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

    LegacyDigesto.select(:TEXLIBRO).distinct.each do |l|
      unless l.TEXLIBRO.blank?
        print "."
        lib = Libro.create nombre: l.TEXLIBRO
        d.libros << lib
        LegacyDigesto.select(:TEXTIT).where(TEXLIBRO: l.TEXLIBRO).distinct.each do |t|
          unless t.TEXTIT.blank?
            print "."
            tit = Titulo.create nombre: t.TEXTIT
            lib.titulos << tit
            LegacyDigesto.select(:TEXCAP).where(TEXTIT: t.TEXTIT).distinct.each do |c|
              unless c.TEXCAP.blank?
                print "."
                cap = Capitulo.create nombre: c.TEXCAP
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
  end

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

end
