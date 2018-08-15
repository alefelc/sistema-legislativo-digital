namespace :populate do
  desc "Cargar firmantes de los trámites dentro de la DB"
  task signators: :environment do
    records = [
      ["Dante Camilo", "Vieyra", "Secretaría de Gobierno y Desarrollo Regional"]
      ["Mauricio", "Dova", "Secretaría de Políticas Sociales"]
      ["Guillermo Luis", "Natali", "Secretaría de Control y Prevención Ciudadana"]

      # ["Franco", "Castaldi", "Director de Gestión de Programas del Instituto Municipal de la Vivienda (IMV)"],
      # ["Abg. Mauricio Daniel", "Dova", "Secretaría de Gobierno"],
      # ["Pablo Javier", "Antonetti", "Secretaría de Economía"],
      # ["Dante Camilo", "Vieyra", "Secretaría de Desarrollo Social y Económico"],
      # ["Marcelo Guillermo Enrique", "Ferrario", "Secretaría de Salud y Deportes"],
      # ["Guillermo Luis, Natali", "Secretaría de Relaciones Institucionales y Comunicación"],
      # ["Martín", "Cantoro", "Secretaría de Obras Públicas"],
      # ["Enrique Fernando", "Novo", "Secretaría de Servicios Públicos"],
      # ["Roberto Gustavo", "Dova", "Secretaría Privada"],
      # ["Guillermo", "De Rivas", "Secretaría de Gobierno Abierto y Modernización"],
      # ["Julian Carlos", "Oberti", "Fiscal Municipal"],
      # ["Pablo Ezequiel", "Salinas", "Director General del Ente Municipal de Obras Sanitarias (EMOS)"],
      # ["Pablo Fabián", "Pellegrini", "Director Presidente del Ente Descentralizado de Control Municipal (EDECOM)"]
    ]
    records.each do |sign|
      name = sign[0]
      surname = sign[1]
      position = sign[2]
      ProcedureSignatory.create name: name, surname: surname, position: position, initiator_type: :dem
    end

    # Intendente
    # ProcedureSignatory.create name: 'Juan Manuel', surname: 'LLamosas', position: 'Intendente', initiator_type: :dem, default: true
  end
end
