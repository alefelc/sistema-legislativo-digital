namespace :fill do
  desc "Fill councilors integration on comisions"
  task commissions_integration: :environment do
    puts "Migrating data..."
    # Comision.find_by(denominacion: "Reforma política").concejals << Concejal.where surname: [""]
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
end
