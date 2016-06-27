namespace :sld_migrate do
  # legacy models are required.
  require "#{Rails.root}/lib/tasks/legacy/legacy_classes.rb"

  TASKS = %w[
               tramites
               data_refactoring
            ]

  desc "Migración de tramites"
  task tramites: :environment do
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    $estimated_time = Time.now
    puts "| - - - - - - - - - - - - - - - - - |"
    puts "| -   Beginning data migration    - |"
    puts "| - - - - - - - - - - - - - - - - - |\n"
    LegacyTramite.select(:nro_fojas, :asunto).each do |lt|
      print '.'
      process = Tramite.new do |t|
        t.nro_fojas = lt.nro_fojas
        t.asunto = lt.asunto
        t.observaciones = lt.observaciones
        t.type = lt.type
        t.created_at = lt.created_at
        t.updated_at = lt.updated_at
      end
      process.save(validate: false)
      #Destino
      process.areas << Area.create denominacion: lt.destino
      #Iniciador
      name = lt.
      surname = lt.
      process.persons << Person.create nombre: name, apellido: surname
    end
  end

  desc "Migración de tramites"
  task users: :environment do
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    LegacyAdminUsers.all.each do |t|
      print '.'
      user = User.new t.as_json.reject{ |x| x == "id" }
      user.save(validate: false)
    end
  end

  task comisions: :environment do
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    ActiveRecord::Base.record_timestamps = true
    LegacyComisions.uniq.pluck(:denominacion).each do |t|
      print '.'
      Comision.create denominacion: t if t.present?
    end
  end

  desc "Refactorización de datos"
  task data_refactoring: :environment do
    puts "| - - - - - - - - - - - - - - - - - - |"
    puts "| - - - Data migration FINISHED - - - |"
    puts "| - - - - - - - - - - - - - - - - - - |\n"
    puts "Tiempo estimado #{ Time.now - $estimated_time }s"
  end

  desc "Run all jobs"
  task :all => TASKS
end
