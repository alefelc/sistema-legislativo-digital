namespace :users do
  desc "Add some users"
  task migrate: :environment do
    puts "Adding users.."
    ticket_table_role = Role.where name: ["Trámites", "Expediente administrativo"]
    legislative_role = Role.where name: "Expediente legislativo"
    User.create do |u|
      u.email = "jlgasparrini@gmail.com"
      u.password = "password"
      u.roles << Role.all
      u.person = Person.create name: "Leonel", surname: "Gasparrini"
      u.admin = true
    end
    print "."

    User.create do |u|
      u.email = "alcides.ricotto@gmail.com"
      u.password = "aricotto123"
      u.roles << Role.all
      u.person = Person.create name: "Alcides", surname: "Ricotto"
      u.admin = true
    end
    print "."

    User.create do |u|
      u.email = "rarias@gmail.com"
      u.password = "rarias123"
      u.roles << legislative_role
      u.person = Person.create name: "Romina", surname: "Arias"
    end
    print "."

    User.create do |u|
      u.email = "mechenique@live.com"
      u.password = "mechenique123"
      u.roles << ticket_table_role
      u.person = Person.create name: "Maria Rosa", surname: "Etchenique"
    end
    print "."

    User.create do |u|
      u.email = "lpermigiani@hotmail.com"
      u.password = "lpermigiani123"
      u.roles << ticket_table_role
      u.person = Person.create name: "Lorena", surname: "Permigiani"
    end
    print "."

    User.create do |u|
      u.email = "carinacandellero@gmail.com"
      u.password = "ccandellero123"
      u.roles << ticket_table_role
      u.person = Person.create name: "Carina", surname: "Candellero"
    end
    print "."

    User.create do |u|
      u.email = "fegasdel@hotmail.com"
      u.password = "fegasdel123"
      u.roles << legislative_role
      u.person = Person.create name: "Federico", surname: "Delborgo"
    end
    print "."

    puts "\n - - - - - - - - - - - - - Users loaded successfully!\n"
  end
end
