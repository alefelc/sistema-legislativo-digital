namespace :councilors do
  desc "Add councilors to staging environment"
  task migrate: :environment do
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
end
