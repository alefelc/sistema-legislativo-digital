namespace :legacy_migrate do

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
      p = Concejal.create
      p.nombre = c.NOMBRE
      p.apellido = c.APELLIDO
      p.partido = c.PARTIDO
      find = Periodo.find_by_year(c.PERIODOD, c.PERIODOH)
      if find.empty?   
        p.periodos.create do |per|
          per.desde = Date.new.change year: c.PERIODOD
          per.hasta = Date.new.change day: 31, month: 12, year: c.PERIODOH
        end
      else
        p.periodos << find  
      end   
      puts "creo concejal #{p.nombre}"
    end
  end  

  # Falta agregar la condicion para que no agregue comisiones repetidas
  desc "Migracion de comisiones"
  task comisiones: :environment do
    # requerimos los modelos legacy
    require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
    # Iteramos por todos las comisiones legacy
    LegacyComision.all.each do |com|
      c = Comision.create
      c.denominacion = com.DENOMINAC
      c.codigo = com.CODIGO
      find = Periodo.find_by_year(com.PERIODOD, com.PERIODOH)
      if find.empty?   
        c.periodos.create do |per|
          per.desde = Date.new.change year: com.PERIODOD
          per.hasta = Date.new.change day: 31, month: 12, year: com.PERIODOH
        end
      else
        c.periodos << find  
      end
      c.save   
      puts "creo comision #{c.denominacion}"
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

  desc "ejecutar todas las tareas"
  task :tareas => [:particulares, :juridicas, :periodos, :concejales, :comisiones]
  
end
