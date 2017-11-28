namespace :populate do
  TASKS = %w(
    roles areas users periods commissions signators
    commission_members government_agencies
  )

  desc "Cargar roles dentro de la DB"
  task roles: :environment do
    puts "Adding roles"
    Roles::Activity.activities_with_name.each do |role|
      title = role[:title]
      activities = role[:activities].collect { |x| x[:activity] }
      Role.create name: title, activities: activities
      print "."
    end
    puts " - - - - - - - - - - - - - - - Roles added successfully!!"
  end

  desc "Destroy all and create correct areas"
  task areas: :environment do
    puts "Migrating areas..."
    Area.create name: 'Mesa de Entradas'
    print "."
    Area.create name: 'Secretaría Legislativa'
    print "."
    puts "\n - - - - - - - - - - - - Areas added successfully \n"
  end

  desc "Add some users"
  task users: :environment do
    puts "Adding users.."
    ticket_table_role = Role.where name: ["Trámites", "Expediente administrativo"]
    legislative_role = Role.where name: "Expediente legislativo"
    User.create do |u|
      u.email = "jlgasparrini@gmail.com"
      u.password = "password"
      u.roles << Role.all
      u.person = Person.create name: "Leonel", surname: "Gasparrini"
      u.admin = true
      u.areas << Area.all
    end
    print "."

    User.create do |u|
      u.email = "alcides.ricotto@gmail.com"
      u.password = "aricotto123"
      u.roles << Role.all
      u.person = Person.create name: "Alcides", surname: "Ricotto"
      u.admin = true
      u.areas << Area.all
    end
    print "."

    # User.create do |u|
    #   u.email = "rarias@gmail.com"
    #   u.password = "rarias123"
    #   u.roles << legislative_role
    #   u.person = Person.create name: "Romina", surname: "Arias"
    #   u.areas << Area.find_by(name: 'Secretaría Legislativa')
    # end
    # print "."

    # User.create do |u|
    #   u.email = "mechenique@live.com"
    #   u.password = "mechenique123"
    #   u.roles << ticket_table_role
    #   u.person = Person.create name: "Maria Rosa", surname: "Etchenique"
    #   u.areas << Area.find_by(name: 'Mesa de Entradas')
    # end
    # print "."

    User.create do |u|
      u.email = "lpermigiani@hotmail.com"
      u.password = "lpermigiani123"
      u.roles << ticket_table_role
      u.person = Person.create name: "Lorena", surname: "Permigiani"
      u.areas << Area.find_by(name: 'Mesa de Entradas')
    end
    print "."

    User.create do |u|
      u.email = "carinacandellero@gmail.com"
      u.password = "ccandellero123"
      u.roles << ticket_table_role
      u.person = Person.create name: "Carina", surname: "Candellero"
      u.areas << Area.find_by(name: 'Mesa de Entradas')
    end
    print "."

    User.create do |u|
      u.email = "fegasdel@hotmail.com"
      u.password = "fegasdel123"
      u.roles << legislative_role
      u.person = Person.create name: "Federico", surname: "Delborgo"
      u.areas << Area.find_by(name: 'Secretaría Legislativa')
    end
    print "."

    user = User.find_by email: "leo@admin.com"
    user.areas << Area.all
    user.roles << Role.all
    user.update(admin: true)
    puts "."

    user = User.find_by email: "mechenique@entrada.com"
    user.areas << Area.find_by(name: 'Mesa de Entradas')
    user.roles << ticket_table_role
    puts "."

    user = User.find_by email: "rarias@entrada.com"
    user.areas << Area.find_by(name: 'Secretaría Legislativa')
    user.roles << legislative_role
    puts "."

    user = User.find_by email: "romiarias@entrada.com"
    user.areas << Area.find_by(name: 'Secretaría Legislativa')
    user.roles << legislative_role
    puts "."

    user = User.find_by email: "guille@admin.com"
    user.areas << Area.all
    user.roles << Role.all
    user.update(admin: true)
    puts "."

    puts "\n - - - - - - - - - - - - - Users loaded successfully!\n"
  end

  desc "Fill periods"
  task periods: :environment do
    puts "Adding periods...."
    Periodo.create desde: "Mon, 02 Jul 2012", hasta: "Fri, 01 Jul 2016"
    print "."
    Periodo.create desde: "Sat, 02 Jul 2016", hasta: "Thu, 02 Jul 2020"
    print "."
    puts "\n - - - - - - - - - - - - - - Periods added succesfully! \n"
  end

  desc "Fill commissions"
  task commissions: :environment do
    commissions = [
      "Reforma política",
      "Derechos Humanos",
      "Desarrollo Económico y Agroindustria",
      "Desarrollo Humano, Cultura y Deportes",
      "Desarrollo Social y Salud",
      "Economía y Presupuesto",
      "Educación, Mujer, Niñez y Adolescencia",
      "Gobierno Peticiones Generales, Acuerdos, Interpretaciones y Relaciones Institucionales",
      "Modernización del Estado y Seguridad",
      "Obras Públicas y Vialidad",
      "Planificación y Coordinación de Labor",
      "Planificación y Gestión Ambiental",
      "Servicios Públicos y Desarrollo Urbano"
    ]
    puts "Loading commissions"
    commissions.each do |c|
      print "."
      Periodo.last.comisions.create(denominacion: c)
    end
    puts "\n - - - - - - - - - - - - - - - - - Loading commisions ended\n"
  end

  desc "Add councilors to staging environment"
  task councilors: :environment do
    puts "Loading councilors..."
    councilors = [
      ["Bressan", "Marcelo Antonio"],
      ["Concordano", "Estela Graciela"],
      ["Chiappe", "Armando Aníbal"],
      ["Fernández", "Cristina Isabel"],
      ["Fuentes", "Darío Enrique"],
      ["Martínez", "María Graciela"],
      ["Meirotti", "Ricardo"],
      ["Paulizzi", "Leticia Anahí"],
      ["Petrone", "María Andrea"],
      ["Rasmusen", "Silvio Raúl"],
      ["Sabarinni", "Ema Vilma"],
      ["Rins", "Ismael Emiliano"],
      ["Panza", "María Alicia"],
      ["Ordoñez", "Carlos Ariel"],
      ["Lannutti", "Mónica Graciela"],
      ["Carranza", "Martín Ignacio Alejandro"],
      ["Betorz", "Ricardo Manuel"],
      ["Segre", "Jimena Soledad"],
      ["Carrizo", "Pablo Rafael"],
      ["Gadpen", "Marilina"]
    ]
    councilors.each do |c|
      Periodo.last.concejals.create surname: c[0], name: c[1]
      print "."
    end
    puts "\n - - - - - - - - - - - - - Councilors loaded successfully!! \n"
  end

  desc "Cargar firmantes de los trámites dentro de la DB"
  task signators: :environment do
    records = [
      ["Franco", "Castaldi", "Director de Gestión de Programas del Instituto Municipal de la Vivienda (IMV)"],
      ["Abg. Mauricio Daniel", "Dova", "Secretaría de Gobierno"],
      ["Pablo Javier", "Antonetti", "Secretaría de Economía"],
      ["Dante Camilo", "Vieyra", "Secretaría de Desarrollo Social y Económico"],
      ["Marcelo Guillermo Enrique", "Ferrario", "Secretaría de Salud y Deportes"],
      ["Guillermo Luis, Natali", "Secretaría de Relaciones Institucionales y Comunicación"],
      ["Martín", "Cantoro", "Secretaría de Obras Públicas"],
      ["Enrique Fernando", "Novo", "Secretaría de Servicios Públicos"],
      ["Roberto Gustavo", "Dova", "Secretaría Privada"],
      ["Guillermo", "De Rivas", "Secretaría de Gobierno Abierto y Modernización"],
      ["Julian Carlos", "Oberti", "Fiscal Municipal"],
      ["Pablo Ezequiel", "Salinas", "Director General del Ente Municipal de Obras Sanitarias (EMOS)"],
      ["Pablo Fabián", "Pellegrini", "Director Presidente del Ente Descentralizado de Control Municipal (EDECOM)"]]

    records.each do |sign|
      name = sign[0]
      surname = sign[1]
      position = sign[2]
      ProcedureSignatory.create name: name, surname: surname, position: position, initiator_type: :dem
    end

    # Intendente
    ProcedureSignatory.create name: 'Juan Manuel', surname: 'LLamosas', position: 'Intendente', initiator_type: :dem, default: true
  end

  desc "Fill councilors integration on comisions"
  task commission_members: :environment do
    puts "Migrating data..."
    Comision.find_by(denominacion: "Reforma política").concejals <<
      Concejal.where(surname: ["Ordoñez", "Carranza", "Bressan", "Petrone", "Paulizzi", "Carrizo"])
      print "."
    Comision.find_by(denominacion: "Derechos Humanos").concejals <<
      Concejal.where(surname: ["Gadpen", "Petrone", "Segre", "Chiappe", "Concordano", "Fernández", "Lannutti"])
      print "."
    Comision.find_by(denominacion: "Desarrollo Económico y Agroindustria").concejals <<
      Concejal.where(surname: ["Meirotti", "Panza", "Martínez", "Chiappe", "Fernández", "Sabarini", "Carrizo"])
      print "."
    Comision.find_by(denominacion: "Desarrollo Humano, Cultura y Deportes").concejals <<
      Concejal.where(surname: ["Rasmusen", "Meirotti", "Chiappe", "Fernández", "Lannutti", "Segre"])
      print "."
    Comision.find_by(denominacion: "Desarrollo Social y Salud").concejals <<
      Concejal.where(surname: ["Martínez", "Betorz", "Concordano", "Bressan", "Rasmusen", "Panza", "Carrizo"])
      print "."
    Comision.find_by(denominacion: "Economía y Presupuesto").concejals <<
      Concejal.where(surname: ["Concordano", "Betorz", "Bressan", "Chiappe", "Fernández", "Panza", "Carranza"])
      print "."
    Comision.find_by(denominacion: "Educación, Mujer, Niñez y Adolescencia").concejals <<
      Concejal.where(surname: ["Concordano", "Rasmusen ", "Lannutti", "Bressan", "Petrone", "Gadpen", "Segre"])
      print "."
    Comision.find_by(denominacion: "Gobierno Peticiones Generales, Acuerdos, Interpretaciones y Relaciones Institucionales").concejals <<
      Concejal.where(surname: ["Concordano", "Petrone ", "Carranza", "Concordano", "Martínez", "Chiappe", "Sabarini", "Carrizo"])
      print "."
    Comision.find_by(denominacion: "Modernización del Estado y Seguridad").concejals <<
      Concejal.where(surname: ["Betorz", "Bressan", "Rasmusen", "Chiappe", "Concordano", "Chiappe", "Ordóñez", "Segre"])
      print "."
    Comision.find_by(denominacion: "Obras Públicas y Vialidad").concejals <<
      Concejal.where(surname: ["Martínez", "Betorz", "Rasmusen", "Bressan", "Concordano", "Panza", "Carrizo"])
      print "."
    Comision.find_by(denominacion: "Planificación y Coordinación de Labor").concejals <<
      Concejal.where(surname: ["Fuentes", "Paulizzi", "Ordóñez", "Carrizo"])
      print "."
    Comision.find_by(denominacion: "Planificación y Gestión Ambiental").concejals <<
      Concejal.where(surname: ["Chiappe", "Segre", "Meirotti", "Martínez", "Fernández", "Carranza", "Betorz"])
      print "."
    Comision.find_by(denominacion: "Servicios Públicos y Desarrollo Urbano").concejals <<
      Concejal.where(surname: ["Bressan", "Carranza", "Rasmusen", "Martínez", "Meirotti", "Gadpen", "Carrizo"])
      print "."
    puts "\n - - - - - - - - - - - Migration finished \n"
  end

  desc "Populate government agencies"
  task government_agencies: :environment do
    puts "Adding government agencies"
    OrganoDeGobierno.create denominacion: "DEPARTAMENTO EJECUTIVO MUNICIPAL", codigo: "DEM"
    print "."
    OrganoDeGobierno.create denominacion: "Secretaría Legislativa", codigo: "SL"
    print "."
    puts "\n - - - - - - - - - - - - - - - - - - Government agencies successfully added! \n"
  end

  desc "Populate bloques"
  task bloques: :environment do
    puts "Populate bloques"
    Bloque.create denominacion: "UNIÓN POR CÓRDOBA", periodos: [Periodo.last]
    print "."
    Bloque.create denominacion: "FRENTE CAMBIEMOS PARA EL DESARROLLO DE RÍO CUARTO", periodos: [Periodo.last]
    print "."
    Bloque.create denominacion: "RESPETO MST", periodos: [Periodo.last]
    print "."
  end

  desc "Populate municipal offices"
  task municipal_offices: :environment do
    mun_offices = [
      "CONSEJO MUNICIPAL DEL ARBOLADO PUBLICO", "DEFENSORIA DEL PUEBLO",
      "FUNDACION POR LA CULTURA", "JUNTA ELECTORAL MUNICIPAL", "SEC. DE DESARROLLO URBANO, OBRAS Y SSPP",
      "SEC. DE GOBIERNO Y REL. INSTITUCIONALES", "SECRETARIA DE ECONOMIA", "SECRETARIA DE OBRAS PUBLICAS",
      "SECRETARIA DE RELACIONES INSTIT. Y COMUN", "SECRETARIA DE SALUD Y DEPORTES",
      "SECRETARIO DE CULTURA", "SUBSECRET. DE AGROINDUSTRIA Y COMERCIO",
      "SUBSECRETARIA DE CULTURA", "SUBSECRETARIA DE DEPORTES", "SUBSECRETARIA DE GOBIERNO",
      "SUBSECRETARIA DE HACIENDA", "SUBSECRETARIA DE TRANSPORTE",
      "SUBSECRETARIO LEGAL Y TECNICO", "TRIBUNAL DE CUENTAS"
    ]
    mun_offices.each do |x|
      MunicipalOffice.create denominacion: x
    end
  end

  desc "Run all tasks to populate the database"
  task :data => TASKS
end
