namespace :db do
  desc "Cargar firmantes de los trámites dentro de la DB"
  task populate_signatories: :environment do
    records = [["Javier", "De Olmos", "Subsecretaría de Gobierno"],
      ["Ricardo", "Muñoz (h)", "Subsecretaría de Legal y Técnico"],
      ["Irina", "Terzagui", "Subsecretaría de Hacienda"],
      ["Daniel", "Reiloba", "Subsecretaría de Agroindustria y Comercio"],
      ["Ricardo", "Rojas", "Subsecretaría de Relaciones Institucionales"],
      ["Julio", "Jaule", "Subsecretaría de Transporte"],
      ["Pablo", "Bertea", "Subsecretaría de Desarrollo Social"],
      ["Isaac", "Pérez Villarreal", "Subsecretaría de Salud"],
      ["Sara", "Bergesio", "Subsecretaría de la Mujer"],
      ["Ana", "Medina", "Subsecretaría de Niñez, Adolescencia y Familia"],
      ["Mercedes", "Novaira", "Subsecretaría de Educación y Culto"],
      ["Daniela", "Miranda", "Subsecretaría de Derechos Humanos"],
      ["Martín", "Herrera", "Subsecretaría de Deporte"],
      ["Nicolás", "Llamosas", "Subsecretaría de Tecnología de la Información y Gestión"],
      ["Esteban", "Gómez", "Subsecretaría de Desarrollo Regional"],
      ["Isabel", "Cucco", "Secretaría de Recursos Humanos"],
      ["Diego", "Formía", "Subsecretario de Cultura"],
      ["Marcelo", "Dutto", "Subsecretario de Trabajo"],
      ["Alejandro", "Bongiovanni", "Subsecretario de Vivienda"],
      ["Franco", "Castaldi", "Director de Gestión de Programas del Instituto Municipal de la Vivienda (IMV)"],
      ["Antonio", "Corteggiano", "Subsecretario de Planificación Urbana"],
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
    ProcedureSignatory.create name: 'Juan Manuel', surname: 'LLamosas', position: 'Intendente', default: true
  end
end
