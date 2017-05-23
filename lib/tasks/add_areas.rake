namespace :areas do
  desc "Destroy all and create correct areas"
  task migrate: :environment do
    Area.destroy_all
    Area.create name: 'Mesa de Entradas'
    Area.create name: 'Secretaria Legislativa'
  end
end
