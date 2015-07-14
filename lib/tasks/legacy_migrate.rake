namespace :legacy_migrate do

  desc "Migracion de particulares"
  task particulares: :environment do
  	# requerimos los modelos legacy
  	require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"
  	# Iteramos por todos los cientes legacy
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

end
