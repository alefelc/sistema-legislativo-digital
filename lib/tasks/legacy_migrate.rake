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
               data_refactoring
             ]

  desc "Migracion de particulares"
  task particulares: :environment do
  	# requerimos los modelos legacy
  	require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los particulares legacy
		LegacyPart.select(:NOMBRE, :APELLIDO, :TIPO_DOC, :NUM_DOC, :DOMICILIO).each do |part|
  		p = Fisica.new
  		p.nombre = part.NOMBRE
  		p.apellido = part.APELLIDO
  		p.tipo_doc = part.TIPO_DOC
  		p.nro_doc	 = part.NUM_DOC
  		p.domicilio = part.DOMICILIO
  		p.save
  	end

    puts "Finalizada migración de particulares"
    puts "...\n"
  end

  desc "Migracion de concejales"
  task concejales: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los concejales legacy
    LegacyConcejal.all.each do |c|
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

    puts "Finalizada migración de concejales"
    puts "...\n"
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
        c = Comision.create denominacion: com.DENOMINAC, codigo: com.CODIGO
        c_legadas.each { |cm| c.periodos << Periodo.find_by_year(cm.PERIODOD, cm.PERIODOH) }
      end
    end
    puts "Finalizada migración de comisiones"
    puts "...\n"
  end

  desc "Migracion de personas juridicas"
  task juridicas: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los particulares legacy
    LegacyJuridica.select(:DENOMINAC).each { |j| Juridica.create nombre: j.DENOMINAC }

    puts "Finalizada migración de personas jurídicas"
    puts "...\n"
  end

  desc "Migracion de periodos"
  task periodos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los periodos legacy
    LegacyPeriodo.select(:PERIODOD, :PERIODOH).each do |periodo|
      Periodo.create do |p|
        p.desde = Date.new.change year: periodo.PERIODOD
        p.hasta = Date.new.change day: 31, month: 12, year: periodo.PERIODOH
      end
    end

    puts "Finalizada migración de períodos"
    puts "...\n"
  end

  desc "Migracion de bloques"
  task bloques: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    # Iteramos por todos los bloques legacy
    LegacyBloque.all.each do |bloque|
      b = create_bloque bloque
      b.periodos << Periodo.find_by_year(bloque.PERIODOD, bloque.PERIODOH)
      LegacyConcejal.where(PARTIDO: bloque.CODIGO).each do |c|
        Concejal.find_by(nombre: c.NOMBRE, apellido: c.APELLIDO).update_attribute :bloque, b
      end
    end

    puts "Finalizada migración de períodos"
    puts "...\n"
  end

  desc "Migracion de reparticiones oficiales y dependencias municipales"
  task repart_oficiales_depend_municipal: :environment do
  	# requerimos los modelos legacy
  	require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyReparticionOficial.select(:DENOMINAC).distinct.each do |x|
      ReparticionOficial.create denominacion: x.DENOMINAC
    end

    puts "Finalizada migración de reparticiones oficiales"
    puts "...\n"

    LegacyDependenciaMunicipal.select(:DENOMINAC).distinct.each do |x|
      DependenciaMunicipal.create denominacion: x.DENOMINAC
    end

    puts "Finalizada migración de dependencias municipales"
    puts "...\n"
  end

  desc "Migracion de expedientes"
  task expedientes: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpediente.all.each do |e|
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
      puts "Creo expediente #{exp.inspect}"
    end

    puts "Finalizada migración de expediente"
    puts "...\n"
  end

  desc "Migracion de expedientes_acumulados"
  task expedientes_acumulados: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpediente.select(:ACUM, :ANO_EXPED, :BIS_EXPED, :NUM_EXPED).where("ACUM != 0").each do |e|
      fe = LegacyExpediente.find_by_ind(e.ACUM)
      fe2 = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               fe.ANO_EXPED, fe.BIS_EXPED, fe.NUM_EXPED.to_s)
      exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               e.ANO_EXPED, e.BIS_EXPED, e.NUM_EXPED.to_s)
      fe2.acumulados << exp
    end

    puts "Finalizada migración de expedientes acumulados"
    puts "...\n"
  end

  desc "Migracion de expedientes adjuntados fisicamente"
  task expedientes_adjuntados_fisicamente: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpediente.select(:ADJFIS, :ANO_EXPED, :BIS_EXPED, :NUM_EXPED).where("ADJFIS != 0").each do |e|
      fe = LegacyExpediente.find_by_ind(e.ADJFIS)
      fe2 = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               fe.ANO_EXPED, fe.BIS_EXPED, fe.NUM_EXPED.to_s)
      exp = Expediente.find_by("EXTRACT(year FROM anio) = ? AND bis = ? AND nro_exp = ?",
                               e.ANO_EXPED, e.BIS_EXPED, e.NUM_EXPED.to_s)
      fe2.acumulados << exp
    end

    puts "Finalizada migración de expedientes acumulados"
    puts "...\n"
  end

  desc "Migracion de expedientes administrativos"
  task expedientes_administrativos: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

    LegacyExpedienteAdministrativo.select(:IND_EXP, :NUMEROEA, :LETRAEA, :SUBEA, :ANOEA).each do |e|
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
  end

  desc "Refactorizacion de datos"
  task data_refactoring: :environment do
    puts "Migracion de datos finalizada\n"
  end

  desc "ejecutar todas las tareas"
  task :tareas => TAREAS do
    puts "Finalizada migración de expedientes administrativos"
    puts "...\n"
  end

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
