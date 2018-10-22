##  This population is used only for legislative files that missing
## its initial state.
## to-run:
##   bundle exec rake populate:legislative_file_states

namespace :populate do
  desc "Cargar estados inicial para los expedientes legislativos"
  task legislative_file_states: :environment do
    puts "Populating initial states!!!!\n"
    records_updated = 0
    LegislativeFile.all.each do |file|
      states = file.legislative_file_states
      if states.empty? || states.collect(&:name).exclude?("initialized")
        state_date = file.date
        if file.first_loop.origin_procedures.present?
          procedure = file.first_loop.origin_procedures.first
          state_date = procedure.created_at
        end
        state_date ||= file.created_at

        ## Submit legislative file state!!
        file.legislative_file_states.create date_at: state_date
        records_updated = records_updated + 1
        print "."
      end
    end
    puts "\n\n- - - - - - Initial Legislative File States added successfully!!"
    puts "\n #{records_updated} records updated. \n"
  end

  desc "Corrige fecha inicial para los expedientes legislativos"
  task fix_state_date: :environment do
    puts "Fixing initial states!!!!\n"
    records_updated = 0
    LegislativeFile.all.each do |file|
      initial_state = file.legislative_file_states.initialized.first
      if initial_state.blank?
        puts "\nSomething wrong with legislative file #{file.id}\n"
      else
        initial_state.update date_at: file.date
        records_updated = records_updated + 1
        print "."
      end
    end
    puts "\n\n- - - - - - Fixing initial states finish successfully!!!!\n"
    puts "\n #{records_updated} records updated. \n"
  end
end
