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
  		puts "creo persona #{p.nombre}"
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
      p.desde = Date.new.change year: periodo.PERDES
      p.hasta = Date.new.change day: 31, month: 12, year: periodo.PERHAS
      p.save 
      puts "creo periodo #{p.inspect}"
    end
  end

end
