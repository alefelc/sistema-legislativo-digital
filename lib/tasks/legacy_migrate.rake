namespace :legacy_migrate do

  TAREAS = %w[  particulares 
                juridicas 
                periodos 
                concejales 
                comisiones 
                bloques 
                repart_oficiales_depend_municipal 
                expedientes
                expedientes_acumulados
                expedientes_adjuntados_fisicamente
              ]

  desc "Migracion de particulares"
  task particulares: :environment do
  	# requerimos los modelos legacy
  	require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
  	# Iteramos por todos los particulares legacy
		LegacyPart.all.each do |part|
  		p = Fisica.new
  		p.nombre = part.NOMBRE
  		p.apellido = part.APELLIDO
  		p.tipo_doc = part.TIPO_DOC
  		p.nro_doc	 = part.NUM_DOC
  		p.domicilio = part.DOMICILIO
  		p.save
  		puts "creo particular #{p.nombre}"
  	end
  end

  desc "Migracion de concejales"
  task concejales: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
    # Iteramos por todos los concejales legacy
    LegacyConcejal.all.each do |c|

      if concejal_exists? c
        p = Concejal.find_by nombre: c.NOMBRE, apellido: c.APELLIDO
      else
        p = Concejal.create do |x|
          x.nombre = c.NOMBRE
          x.apellido = c.APELLIDO
        end
      end

      find = Periodo.find_by_year(c.PERIODOD, c.PERIODOH)
      if find.empty?
        p.periodos.create do |per|
          per.desde = Date.new.change year: c.PERIODOD
          per.hasta = Date.new.change day: 31, month: 12, year: c.PERIODOH
        end
      else
        p.periodos << find
      end
      p.save
      puts "creo concejal #{p.nombre}"
    end
  end

  desc "Migracion de comisiones"
  task comisiones: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
    # Iteramos por todos las comisiones legacy
    LegacyComision.all.each do |com|
      c_legadas = LegacyComision.where(CODIGO: com.CODIGO)
      c_actuales = Comision.where(codigo: com.CODIGO)
      if !c_legadas.empty? and c_actuales.count == 0
        c = Comision.create
        c.denominacion = com.DENOMINAC
        c.codigo = com.CODIGO
        c_legadas.each do |cm|
          c.periodos << Periodo.find_by_year(cm.PERIODOD, cm.PERIODOH)
        end
        c.save
        puts "creo comision #{c.denominacion}"
      end
    end
  end

  desc "Migracion de personas juridicas"
  task juridicas: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
    # Iteramos por todos los particulares legacy
    LegacyJuridica.all.each do |j|
      p = Juridica.new
      p.nombre = j.DENOMINAC
      p.save
      puts "creo persona juridica #{p.nombre}"
    end
  end

  desc "Migracion de periodos"
  task periodos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
    # Iteramos por todos los periodos legacy
    LegacyPeriodo.all.each do |periodo|
      p = Periodo.new
      p.desde = Date.new.change year: periodo.PERIODOD
      p.hasta = Date.new.change day: 31, month: 12, year: periodo.PERIODOH
      p.save
      puts "creo periodo #{p.inspect}"
    end
  end

  desc "Migracion de bloques"
  task bloques: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
    # Iteramos por todos los periodos legacy
    LegacyBloque.all.each do |bloque|

      if bloque_exists? bloque
        b = Bloque.find_by codigo: bloque.CODIGO
      else
        b = Bloque.create do |x|
          x.denominacion = bloque.DENOMINAC
          x.codigo = bloque.CODIGO
        end
      end

      b.periodos << Periodo.find_by_year(bloque.PERIODOD, bloque.PERIODOH)

      LegacyConcejal.where(PARTIDO: bloque.CODIGO).each do |c|
        concejal = Concejal.find_by(nombre: c.NOMBRE, apellido: c.APELLIDO)
        concejal.bloque = b
        concejal.save
      end

      b.save
      puts "creo bloque #{b.inspect}"
    end
  end

  desc "Migracion de reparticiones oficiales y dependencias municipales"
  task repart_oficiales_depend_municipal: :environment do
  	# requerimos los modelos legacy
  	require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyReparticionOficial.select(:DENOMINAC).distinct.each do |x|
      puts ReparticionOficial.create denominacion: x.DENOMINAC
    end

    LegacyDependenciaMunicipal.select(:DENOMINAC).distinct.each do |x|
      puts DependenciaMunicipal.create denominacion: x.DENOMINAC
    end
  end

  desc "Migracion de expedientes"
  task expedientes: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpediente.all.each do |e|
      c = Circuito.new
      c.nro = 0

      exp = Expediente.new
      exp.nro_exp = e.NUM_EXPED
      exp.bis = e.BIS_EXPED
      exp.tema = e.TEMA
      exp.observacion = e.OBSERV

      find = LegacyTramite.find_by_ind(e.IND_EXP)
      if find.nil?
        exp.anio = Date.new.change year: e.ANO_EXPED
      else  
        exp.anio = find.FECHA
      end
      exp.save
      c.expediente = exp
      c.save
      puts "creo expediente #{exp.inspect}"
    end
  end  

  desc "Migracion de expedientes_acumulados"
  task expedientes_acumulados: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
  
    LegacyExpediente.where("ACUM != 0").each do |e|
      fe = LegacyExpediente.find_by_ind(e.ACUM)
      fe2 = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?", fe.ANO_EXPED, fe.BIS_EXPED, fe.NUM_EXPED.to_s)
      exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?", e.ANO_EXPED, e.BIS_EXPED, e.NUM_EXPED.to_s)
      fe2.acumulados << exp
      puts "acumule #{fe2.id}"
    end
  end

  desc "Migracion de expedientes_adjuntados_fisicamente"
  task expedientes_adjuntados_fisicamente: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
  
    LegacyExpediente.where("ADJFIS != 0").each do |e|
      fe = LegacyExpediente.find_by_ind(e.ADJFIS)
      fe2 = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?", fe.ANO_EXPED, fe.BIS_EXPED, fe.NUM_EXPED.to_s)
      exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?", e.ANO_EXPED, e.BIS_EXPED, e.NUM_EXPED.to_s)
      fe2.acumulados << exp
      puts "adjunte #{fe2.id}"
    end
  end

  desc "ejecutar todas las tareas"
  task :tareas => TAREAS

  def concejal_exists? concej
    Concejal.where(nombre: concej.NOMBRE, apellido: concej.APELLIDO).present?
  end

  def bloque_exists? bloque
    Bloque.where(codigo: bloque.CODIGO).present?
  end

end
