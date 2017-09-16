namespace :areas do
  desc "Destroy all and create correct areas"
  task migrate: :environment do
    puts "Migrating areas..."
    Area.create name: 'Mesa de Entradas'
    print "."
    Area.create name: 'Secretaria Legislativa'
  	print "."
  	puts "\n - - - - - - - - - - - - Areas added successfully \n"
  end
end
