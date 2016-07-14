namespace :db do
  # legacy models are required.

  TASKS = %w[
              users
              gobierno
              areas
              concejales
              comisions
              tramites
              comisions_despachos
              expedientes
              despachos_concejals
              clasificacion
              personal
              data_refactoring
            ]

  desc "Migración de usuarios"
  task users: :environment do
    $estimated_time = Time.now
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    puts "| - - - - - - - - - - - - - - - - - |"
    puts "| -   Beginning data migration    - |"
    puts "| - - - - - - - - - - - - - - - - - |\n"
    LegacyAdminUsers.all.each do |t|
      print '.'
      user = User.new t.as_json.reject{ |x| x == "id" }
      user.save(validate: false)
    end
    puts "\nCarga de usuarios finalizada\n"
  end

  desc "Carga de organos de gobierno"
  task gobierno: :environment do
    OrganoDeGobierno.create denominacion: "DEPARTAMENTO EJECUTIVO MUNICIPAL (DEM)", codigo: "DEM"
    print '.'
    OrganoDeGobierno.create denominacion: "CONCEJO DELIBERANTE RIO CUARTO", codigo: "CONC"
    print '.'
    puts "\nFinalizada carga organos de gobierno\n"
  end

  desc "Carga de areas"
  task areas: :environment do
    Area.create denominacion: "PRESIDENCIA", codigo: "PRES"; print '.'
    Area.create denominacion: "SECRETARIA", codigo: "SEC"; print '.'
    Area.create denominacion: "DIRECCION GRAL LEGISLATIVA", codigo: "LEG"; print '.'
    Area.create denominacion: "DIRECCION GRAL ADMINISTRATIVA", codigo: "ADM"; print '.'
    Area.create denominacion: "DIRECCION GENERAL DE COMISIONES Y RECURSOS HUMANOS", codigo: "RRHH"; print '.'
    Area.create denominacion: "DIRECCION GRAL DE INFORMATICA", codigo: "INF"; print '.'
    Area.create denominacion: "CONTABILIDAD", codigo: "CONT"; print '.'
    Area.create denominacion: "MESA DE ENTRADAS", codigo: "MESA"; print '.'
    Area.create denominacion: "ARCHIVO", codigo: "ARCH"; print '.'
    Area.create denominacion: "PRENSA", codigo: "PREN"; print '.'
    Area.create denominacion: "ACCION SOCIAL", codigo: "SOC"; print '.'
    puts "\nCarga de areas finalizada\n"
  end

  desc "Carga de concejales"
  task concejales: :environment do
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    periodo = Periodo.create desde: '2012-07-02', hasta: '2016-07-01'
    LegacyPersonas.select(:nombre).distinct.each  do |lp|
      #puts ap lp
      nombre = lp.nombre.split(',').first.try :strip
      apellido = lp.nombre.split(',').last.try :strip
      if nombre.present? && apellido.present?
        concejal = Concejal.create nombre: nombre, apellido: apellido
      end
      periodo.concejals << concejal if concejal.present?
      print '.'
    end
    puts "\nFinalizada carga de concejales\n"
  end

  task comisions: :environment do
    [ 'Coordinación y Planificación de Labor',
    'Obras Públicas y Vialidad',
    'Planificación y Desarrollo Sustentable',
    'Gobierno, Peticiones Generales, Acuerdos, Interpretaciones y Rel. Inst',
    'Economía y Presupuesto',
    'COMISION INVESTIGADORA RESOLUCION Nº 851/11',
    'Desarrollo Económico y Relaciones Internacionales',
    'Desarrollo Social, Salud y Deporte',
    'COMISION ESPECIAL DE REFORMA DEL REGLAMENTO INTERNO',
    'Servicios Públicos y Transporte',
    'Derechos Humanos',
    'Coordinación y Planificación de Labor',
    'COM. REFORMA POLITICA',
    'Desarrollo Humano, Educación y Cultura' ].each do |com|
      c = Comision.create denominacion: com, vig_desde: '2012-07-02', vig_hasta: '2016-07-01'
      p = Periodo.where(desde: '2012-07-02', hasta: '2016-07-01').first_or_create
      c.periodos << p
      print '.'
    end
    puts "\nCarga de comisiones finalizada\n"
  end

  desc "Migración de tramites"
  task tramites: :environment do
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    LegacyTramite.all.each do |lt|
      print '.'
      process = Tramite.new do |t|
        t.id            = lt.id
        t.nro_fojas     = lt.nro_fojas
        t.asunto        = lt.asunto
        t.type          = lt.type
        t.fecha         = lt.fecha
        t.observaciones = lt.observaciones
        t.created_at    = lt.created_at
        t.updated_at    = lt.updated_at
      end
      process.save(validate: false)
      #Destino
      if lt.destino.present?
        if lt.destino == "DEM"
          process.organo_de_gobiernos << OrganoDeGobierno.find_by(codigo: 'DEM')
        else
          area = Area.find_by(denominacion: lt.destino)
          process.areas << (area.present? ? area : Area.create(denominacion: lt.destino))
        end
      end
      #Iniciador
      if lt.iniciador.present?
        fisica = Fisica.where(nombre: lt.iniciador,
                              domicilio: lt.domicilio,
                              telefono: lt.telefono,
                              email: lt.email).first_or_create
        process.persons << fisica if fisica.present?
      end
    end
    puts "\nFinalizada carga de trámites\n"
  end

  desc "Carga de asociación entre comisión y despacho"
  task comisions_despachos: :environment do
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    LegacyComisionsDespachos.all.each do |cd|
      denominacion = LegacyComisions.find_by(id: cd.comision_id).try :denominacion
      comision = Comision.find_by denominacion: denominacion
      despacho = Despacho.find_by id: cd.despacho_id
      if comision.present? && despacho.present?
        comision.despachos << despacho
        print '.'
      end
    end
    puts "\nFinalizada asociación entre comisiones y despachos\n"
  end

  desc "Carga de asociación entre despachos y concejales"
  task despachos_concejals: :environment do
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    LegacyDespachosConcejals.all.each do |dc|
      person = LegacyPersonas.find(dc.concejal_id)
      nombre = person.nombre.split(',').first.try :strip
      apellido = person.nombre.split(',').last.try :strip
      concejal = Concejal.find_by(nombre: nombre, apellido: apellido)
      despacho = Despacho.find_by(id: dc.despacho_id)
      despacho.concejals << concejal if despacho.present? && concejal.present?
      print '.'
    end
    puts "\nFinalizada asociación entre despachos y concejales\n"
  end

  desc 'Migración de expedientes'
  task expedientes: :environment do
    require "#{Rails.root}/lib/tasks/legacy/legacy_sld.rb"
    LegacyExpedientes.all.each do |le|
      print '.'
      if le.nro_exp.include? '-'
        le.nro_exp.split('-').each do |exp|
          expediente = Expediente.create do |new|
            new.nro_exp = exp
            new.created_at = le.created_at
            new.updated_at = le.updated_at
          end
          circuito = expediente.circuitos.first
          desp_ids = LegacyExpedientesDespachos.where expediente_id: le.id
          desp_ids.each { |d| circuito.despachos << Tramite.find(d.despacho_id) }
        end
      else
        expediente = Expediente.create do |e|
          if le.nro_exp.present?
            e.nro_exp = le.nro_exp
          elsif le.bis.present? && !le.bis.zero?
            e.nro_exp = le.bis
          end
          e.created_at = le.created_at
          e.updated_at = le.updated_at
        end
        circuito = expediente.circuitos.first
        desp_ids = LegacyExpedientesDespachos.where expediente_id: le.id
        desp_ids.each do |d|
          print ','
          tramite = Tramite.find_by(id: d.despacho_id)
          circuito.despachos << tramite if tramite.present?
        end
      end
    end
    puts "\nFinalizada carga de expedientes\n"
  end

  desc "Carga de las clasificaciones"
  task clasificacion: :environment do
    ## Ordenanza - Contenido
    Clasificacion.create nombre: "General"; print '.'
    Clasificacion.create nombre: "Individual y meros actos administrativos"; print '.'
    Clasificacion.create nombre: "De Servicios Públicos"; print '.'
    Clasificacion.create nombre: "Otras"; print '.'
    Clasificacion.create nombre: "Alcance general"; print '.'
    Clasificacion.create nombre: "Alcance especial"; print '.'
    ## Ordenanza - Vigencia
    Clasificacion.create nombre: "Dictada por razones de emergencia"; print '.'
    Clasificacion.create nombre: "Que contienen normas generales y permanentes"; print '.'
    Clasificacion.create nombre: "Que NO contienen normas generales y permanentes"; print '.'
    Clasificacion.create nombre: "Motivos subsisten"; print '.'
    Clasificacion.create nombre: "Normas generales"; print '.'
    Clasificacion.create nombre: "Normas no generales"; print '.'
    Clasificacion.create nombre: "Plazo determinado y cumplido"; print '.'
    Clasificacion.create nombre: "Plazo determinado y NO cumplido"; print '.'
    Clasificacion.create nombre: "Vigencia sujeta a condición resolutoria"; print '.'
    Clasificacion.create nombre: "Objeto agotado"; print '.'
    Clasificacion.create nombre: "Cumplida"; print '.'
    Clasificacion.create nombre: "NO cumplida"; print '.'
    # Ordenanza - Derog.
    Clasificacion.create nombre: "Derogación sujeta a condición suspensiva"; print '.'
    Clasificacion.create nombre: "Derog. tácita"; print '.'
    Clasificacion.create nombre: "Derog. cumplida"; print '.'
    Clasificacion.create nombre: "Derog. NO cumplida"; print '.'
    # Ordenanza - Modif.
    Clasificacion.create nombre: "Dispone texto ordenado"; print '.'
    ## Decreto - Contenido
    Clasificacion.create nombre: "Autónomo"; print '.'
    # Clasificacion.create nombre: "Individual y meros actos administrativos"
    # Clasificacion.create nombre: "De servicios públicos"
    # Clasificacion.create nombre: "Otras"
    # Clasificacion.create nombre: "Alcance general"
    # Clasificacion.create nombre: "Alcance especial"
    # Decreto - vigencia
    Clasificacion.create nombre: "De necesidad o urgencia"; print '.'
    Clasificacion.create nombre: "Dictado ad referendum"; print '.'
    # Clasificacion.create nombre: "Que contienen normas generales y permanentes"
    # Clasificacion.create nombre: "Que NO contienen normas generales y permanentes"
    # Clasificacion.create nombre: "Motivos subsisten"
    # Clasificacion.create nombre: "Normas generales"
    # Clasificacion.create nombre: "Normas no generales"
    # Clasificacion.create nombre: "Plazo determinado y cumplido"
    # Clasificacion.create nombre: "Plazo determinado y NO cumplido"
    # Clasificacion.create nombre: "Vigencia sujeta a condición resolutoria"
    # Clasificacion.create nombre: "Objeto agotado"
    # Clasificacion.create nombre: "Cumplida"
    # Clasificacion.create nombre: "NO cumplida"
    # Decreto - derog.
    # Clasificacion.create nombre: "Derogación sujeta a condición suspensiva"
    # Clasificacion.create nombre: "Derog. tácita"
    # Clasificacion.create nombre: "Derog. cumplida"
    # Clasificacion.create nombre: "Derog. NO cumplida"
    # Decreto - modif.
    # Clasificacion.create nombre: "Dispone texto ordenado"
    puts "\nFinalizada carga de clasificaciones de las normas\n"
  end

  desc "Carga del personal"
  task personal: :environment do
    Personal.create apellido: "ANDRADA", nombre:"MARIA CELESTE"; print '.'
    Personal.create apellido: "ARIAS", nombre:"ALDO"; print '.'
    Personal.create apellido: "ARIAS", nombre:"MARCELA ROMINA SOLEDAD"; print '.'
    Personal.create apellido: "ARRIETA", nombre:"VICTOR MANUEL"; print '.'
    Personal.create apellido: "BARZOLA", nombre:"FRANCO MAXIMILIANO"; print '.'
    Personal.create apellido: "BAUDINO", nombre:"MARIA DEL VALLE"; print '.'
    Personal.create apellido: "BERTOLA", nombre:"NERINA NATALIA"; print '.'
    Personal.create apellido: "BOTTARINI", nombre:"AGUSTIN"; print '.'
    Personal.create apellido: "BRICCA", nombre:"DIEGO OSCAR"; print '.'
    Personal.create apellido: "BRINGAS", nombre:"HECTOR ALFREDO"; print '.'
    Personal.create apellido: "BRINGAS", nombre:"CLAUDIA  BEATRIZ"; print '.'
    Personal.create apellido: "BRITO", nombre:"MARINA SOLEDAD"; print '.'
    Personal.create apellido: "CANDELLERO", nombre:"CARINA"; print '.'
    Personal.create apellido: "CANEDO", nombre:"EDUARDO ARIEL CEFERINO"; print '.'
    Personal.create apellido: "CAZZOLA", nombre:"JAVIER"; print '.'
    Personal.create apellido: "CLAVEL", nombre:"GUILLERMO JOSE"; print '.'
    Personal.create apellido: "CORIA", nombre:"DAVID ANIBAL"; print '.'
    Personal.create apellido: "DE UNDURRAGA", nombre:"JOSE MARIA"; print '.'
    Personal.create apellido: "DELBORGO", nombre:"FEDERICO GASTON"; print '.'
    Personal.create apellido: "DEMASI", nombre:"ADRIAN MARTIN"; print '.'
    Personal.create apellido: "DEMO", nombre:"PABLO DANIEL"; print '.'
    Personal.create apellido: "ECHENIQUE", nombre:"MARIA ROSA"; print '.'
    Personal.create apellido: "EZCURRA", nombre:"JOSEFINA"; print '.'
    Personal.create apellido: "FARIAS", nombre:"RITA PAMELA"; print '.'
    Personal.create apellido: "FELICI", nombre:"CLAUDIA ISABEL"; print '.'
    Personal.create apellido: "FERREYRA", nombre:"ERNESTO LUIS"; print '.'
    Personal.create apellido: "FUNES", nombre:"EUGENIO SIMON"; print '.'
    Personal.create apellido: "GIMENEZ", nombre:"CAROLINA ANDREA"; print '.'
    Personal.create apellido: "GORDO", nombre:"PAOLA YANINA"; print '.'
    Personal.create apellido: "JUAREZ ORTEGA", nombre:"MARTIN EZEQUIEL"; print '.'
    Personal.create apellido: "JUSTRIBO", nombre:"ALBERTO CARLOS ARIEL"; print '.'
    Personal.create apellido: "LUCENA VIDORET", nombre:"MARIANO"; print '.'
    Personal.create apellido: "LUNA", nombre:"MIGUEL ALEJANDRO"; print '.'
    Personal.create apellido: "LUNA", nombre:"LUIS ALBERTO"; print '.'
    Personal.create apellido: "MAGOIA", nombre:"HERNAN FABRICIO"; print '.'
    Personal.create apellido: "MARCHIO", nombre:"DANIEL ESTEBAN"; print '.'
    Personal.create apellido: "MARCIN ROSAS", nombre:"JORGE OMAR"; print '.'
    Personal.create apellido: "MATUS", nombre:"CINTIA DEL ROSARIO"; print '.'
    Personal.create apellido: "MAZZETTI", nombre:"VANINA ISABEL"; print '.'
    Personal.create apellido: "NALLI", nombre:"MARIA ANTONELLA"; print '.'
    Personal.create apellido: "NAVARRO", nombre:"MARIO ALBERTO"; print '.'
    Personal.create apellido: "ORLANDO", nombre:"GRACIANA ELIZABETH"; print '.'
    Personal.create apellido: "PEREZ", nombre:"LUCAS JAVIER"; print '.'
    Personal.create apellido: "RAMOS", nombre:"MIGUEL ANGEL"; print '.'
    Personal.create apellido: "RE", nombre:"AGUSTIN"; print '.'
    Personal.create apellido: "RODRIGUEZ", nombre:"ALEJANDRO"; print '.'
    Personal.create apellido: "SANCHEZ", nombre:"LILIANA MARIA DEL CARMEN"; print '.'
    Personal.create apellido: "SASSAROLI", nombre:"DANIELA ALEJANDRA"; print '.'
    Personal.create apellido: "SETTO", nombre:"ANA MARIA"; print '.'
    Personal.create apellido: "SOTTILE ODIERNO", nombre:"MARIA CECILIA"; print '.'
    Personal.create apellido: "STEIGERWALD", nombre:"GUILLERMO JAVIER"; print '.'
    Personal.create apellido: "SUAREZ GONZALEZ", nombre:"SANTIAGO MARIA"; print '.'
    Personal.create apellido: "TESIO", nombre:"JEREMIAS EMANUEL"; print '.'
    Personal.create apellido: "TORRES", nombre:"RITA MAGALI"; print '.'
    Personal.create apellido: "VALDANO", nombre:"CHRISTIAN"; print '.'
    Personal.create apellido: "GASPARRINI", nombre:"LEONEL"; print '.'
    puts "\nFinalizada carga personal\n"
  end

  desc "Refactorización de datos"
  task data_refactoring: :environment do
    puts "| - - - - - - - - - - - - - - - - - - |"
    puts "| - - - Data migration FINISHED - - - |"
    puts "| - - - - - - - - - - - - - - - - - - |\n"
    puts "Tiempo estimado #{ Time.now - $estimated_time }s"
  end

  desc "Run all jobs"
  task :sld_migrate => TASKS
end
