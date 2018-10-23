namespace :populate do
  desc "Cargar tiempo de vigencia para los concejales"
  task councilors_effective_time: :environment do
    puts "Starting councilors effective time update...\n"
    Concejal.all.each do |c|
      if c.periodos.empty?
        "\nCouncilors #{c.id} hasn't legislative period.\n"
      else
        print "."
        if c.effective_time_from.blank?
          c.update effective_time_from: c.periodos.last.desde
        end
        if c.effective_time_to.blank?
          c.update effective_time_to: c.periodos.last.hasta
        end
      end
    end

    puts "\n\nFinish councilors date updating...\n"
  end
end
