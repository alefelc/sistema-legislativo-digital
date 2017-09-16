namespace :commissions do
  desc "Fill commissions"
  task migrate: :environment do
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
end
