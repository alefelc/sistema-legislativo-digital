namespace :users do
  desc "Add users to staging environment"
  task migrate: :environment do
    ## Alcides
    User.create do |u|
      u.email = "aricotto@gmail.com"
      u.password = "aricotto123"
      u.roles << []
      u.person = Person.create name: "Alcides", surname: "Ricotto"
    end

    User.create do |u|
      u.email = "rarias@gmail.com"
      u.password = "rarias123"
      u.roles << []
      u.person = Person.create name: "Romina", surname: "Arias"
    end

    User.create do |u|
      u.email = "mrosa@gmail.com"
      u.password = "mrosa123"
      u.roles << []
      u.person = Person.create name: "Maria Rosa", surname: "Etchenique"
    end

    User.create do |u|
      u.email = "lpermigiani@gmail.com"
      u.password = "lpermigiani123"
      u.roles << []
      u.person = Person.create name: "Lorena", surname: "Permigiani"
    end

    Area.create name: 'Mesa de Entradas'
    Area.create name: 'Secretaria Legislativa'
  end
end
