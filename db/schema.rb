# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181001140139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acumulas", force: :cascade do |t|
    t.integer  "acumulado_id"
    t.integer  "acumula_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "acumulas", ["acumula_id"], name: "index_acumulas_on_acumula_id", using: :btree
  add_index "acumulas", ["acumulado_id"], name: "index_acumulas_on_acumulado_id", using: :btree

  create_table "adjunta_fisicamentes", force: :cascade do |t|
    t.integer  "adjuntado_id"
    t.integer  "adjunta_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "adjunta_fisicamentes", ["adjunta_id"], name: "index_adjunta_fisicamentes_on_adjunta_id", using: :btree
  add_index "adjunta_fisicamentes", ["adjuntado_id"], name: "index_adjunta_fisicamentes_on_adjuntado_id", using: :btree

  create_table "administrative_files", force: :cascade do |t|
    t.string   "number"
    t.integer  "sheets"
    t.integer  "bis"
    t.text     "topic"
    t.integer  "file_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "sub_indice"
    t.string   "letter"
    t.integer  "procedure_id"
    t.integer  "year"
  end

  add_index "administrative_files", ["file_id"], name: "index_administrative_files_on_file_id", using: :btree
  add_index "administrative_files", ["procedure_id"], name: "index_administrative_files_on_procedure_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "areas_procedures", id: false, force: :cascade do |t|
    t.integer "area_id"
    t.integer "procedure_id"
  end

  add_index "areas_procedures", ["area_id"], name: "index_areas_procedures_on_area_id", using: :btree
  add_index "areas_procedures", ["procedure_id"], name: "index_areas_procedures_on_procedure_id", using: :btree

  create_table "areas_users", force: :cascade do |t|
    t.integer "area_id"
    t.integer "user_id"
  end

  add_index "areas_users", ["area_id"], name: "index_areas_users_on_area_id", using: :btree
  add_index "areas_users", ["user_id"], name: "index_areas_users_on_user_id", using: :btree

  create_table "authorities", force: :cascade do |t|
    t.integer  "periodo_id"
    t.integer  "person_id"
    t.integer  "internal_position"
    t.date     "assumption_date"
    t.date     "recess_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "bloque_periodos", id: false, force: :cascade do |t|
    t.integer  "bloque_id"
    t.integer  "periodo_id"
    t.integer  "id"
    t.integer  "vice_id"
    t.integer  "presidente_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "bloque_periodos", ["bloque_id"], name: "index_bloque_periodos_on_bloque_id", using: :btree
  add_index "bloque_periodos", ["periodo_id"], name: "index_bloque_periodos_on_periodo_id", using: :btree

  create_table "bloques", force: :cascade do |t|
    t.text     "denominacion"
    t.text     "codigo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bloques_procedures", id: false, force: :cascade do |t|
    t.integer "bloque_id"
    t.integer "procedure_id"
  end

  add_index "bloques_procedures", ["bloque_id"], name: "index_bloques_procedures_on_bloque_id", using: :btree
  add_index "bloques_procedures", ["procedure_id"], name: "index_bloques_procedures_on_procedure_id", using: :btree

  create_table "capitulos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "titulo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "orden"
  end

  create_table "capitulos_normas", force: :cascade do |t|
    t.integer  "orden"
    t.integer  "capitulo_id"
    t.integer  "norma_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "capitulos_normas", ["capitulo_id"], name: "index_capitulos_normas_on_capitulo_id", using: :btree
  add_index "capitulos_normas", ["norma_id"], name: "index_capitulos_normas_on_norma_id", using: :btree

  create_table "clasificacions", force: :cascade do |t|
    t.string   "nombre"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clasificacions_normas", id: false, force: :cascade do |t|
    t.integer "clasificacion_id"
    t.integer "norma_id"
  end

  add_index "clasificacions_normas", ["clasificacion_id"], name: "index_clasificacions_normas_on_clasificacion_id", using: :btree
  add_index "clasificacions_normas", ["norma_id"], name: "index_clasificacions_normas_on_norma_id", using: :btree

  create_table "comisions", force: :cascade do |t|
    t.string   "denominacion"
    t.string   "codigo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "vig_desde"
    t.date     "vig_hasta"
  end

  create_table "comisions_despachos", id: false, force: :cascade do |t|
    t.integer "despacho_id"
    t.integer "comision_id"
  end

  add_index "comisions_despachos", ["comision_id"], name: "index_comisions_despachos_on_comision_id", using: :btree
  add_index "comisions_despachos", ["despacho_id"], name: "index_comisions_despachos_on_despacho_id", using: :btree

  create_table "comisions_legislative_file_states", id: false, force: :cascade do |t|
    t.integer "comision_id"
    t.integer "legislative_file_state_id"
  end

  add_index "comisions_legislative_file_states", ["comision_id"], name: "index_coms_leg_file_states_on_comision_id", using: :btree
  add_index "comisions_legislative_file_states", ["legislative_file_state_id"], name: "index_coms_leg_file_states_on_state_id", using: :btree

  create_table "comisions_people", id: false, force: :cascade do |t|
    t.integer "comision_id"
    t.integer "concejal_id"
  end

  add_index "comisions_people", ["comision_id"], name: "index_comisions_people_on_comision_id", using: :btree
  add_index "comisions_people", ["concejal_id"], name: "index_comisions_people_on_concejal_id", using: :btree

  create_table "comisions_periodos", id: false, force: :cascade do |t|
    t.integer "comision_id"
    t.integer "periodo_id"
  end

  add_index "comisions_periodos", ["comision_id"], name: "index_comisions_periodos_on_comision_id", using: :btree
  add_index "comisions_periodos", ["periodo_id"], name: "index_comisions_periodos_on_periodo_id", using: :btree

  create_table "comisions_personas", id: false, force: :cascade do |t|
    t.integer "comision_id"
    t.integer "concejal_id"
  end

  add_index "comisions_personas", ["comision_id"], name: "index_comisions_personas_on_comision_id", using: :btree
  add_index "comisions_personas", ["concejal_id"], name: "index_comisions_personas_on_concejal_id", using: :btree

  create_table "comisions_procedures", id: false, force: :cascade do |t|
    t.integer "comision_id"
    t.integer "procedure_id"
  end

  add_index "comisions_procedures", ["comision_id"], name: "index_comisions_procedures_on_comision_id", using: :btree
  add_index "comisions_procedures", ["procedure_id"], name: "index_comisions_procedures_on_procedure_id", using: :btree

  create_table "contingency_plans", force: :cascade do |t|
    t.text     "reason"
    t.date     "date_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "signatory"
    t.text     "generator"
  end

  create_table "day_plans", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dependencias_procedures", id: false, force: :cascade do |t|
    t.integer "municipal_office_id"
    t.integer "procedure_id"
  end

  add_index "dependencias_procedures", ["municipal_office_id"], name: "index_dependencias_procedures_on_municipal_office_id", using: :btree
  add_index "dependencias_procedures", ["procedure_id"], name: "index_dependencias_procedures_on_procedure_id", using: :btree

  create_table "despachos_concejals", id: false, force: :cascade do |t|
    t.integer "despacho_id"
    t.integer "concejal_id"
  end

  add_index "despachos_concejals", ["concejal_id"], name: "index_despachos_concejals_on_concejal_id", using: :btree
  add_index "despachos_concejals", ["despacho_id"], name: "index_despachos_concejals_on_despacho_id", using: :btree

  create_table "diario_de_sesions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "digestos", force: :cascade do |t|
    t.string   "nombre"
    t.text     "observacion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "documentacion_presentadas", force: :cascade do |t|
    t.string   "tipo"
    t.integer  "condonacion_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "documentacion_presentadas", ["condonacion_id"], name: "index_documentacion_presentadas_on_condonacion_id", using: :btree

  create_table "laws", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "law_type"
    t.string   "number"
    t.string   "letter"
    t.string   "year"
    t.integer  "legislative_session_id"
    t.date     "communication_date"
  end

  add_index "laws", ["legislative_session_id"], name: "index_laws_on_legislative_session_id", using: :btree

  create_table "laws_legislative_file_states", id: false, force: :cascade do |t|
    t.integer "law_id"
    t.integer "legislative_file_state_id"
  end

  add_index "laws_legislative_file_states", ["law_id"], name: "index_laws_legislative_file_states_on_law_id", using: :btree
  add_index "laws_legislative_file_states", ["legislative_file_state_id"], name: "index_laws_legislative_file_states_on_legislative_file_state_id", using: :btree

  create_table "legislative_file_states", force: :cascade do |t|
    t.text     "especificacion1"
    t.text     "especificacion2"
    t.integer  "loop_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "procedure_id"
    t.integer  "state_type",             default: 0
    t.integer  "name",                   default: 0
    t.date     "date_at"
    t.integer  "legislative_file_id"
    t.integer  "legislative_session_id"
    t.text     "sanction_specified"
    t.text     "sanction_type"
  end

  add_index "legislative_file_states", ["legislative_file_id"], name: "index_legislative_file_states_on_legislative_file_id", using: :btree
  add_index "legislative_file_states", ["legislative_session_id"], name: "index_legislative_file_states_on_legislative_session_id", using: :btree
  add_index "legislative_file_states", ["loop_id"], name: "index_legislative_file_states_on_loop_id", using: :btree
  add_index "legislative_file_states", ["procedure_id"], name: "index_legislative_file_states_on_procedure_id", using: :btree

  create_table "legislative_file_states_loops", id: false, force: :cascade do |t|
    t.integer "legislative_file_state_id"
    t.integer "loop_id"
  end

  add_index "legislative_file_states_loops", ["legislative_file_state_id"], name: "index_leg_file_states_loops_on_state_id", using: :btree
  add_index "legislative_file_states_loops", ["loop_id"], name: "index_leg_file_states_loops_on_loop_id", using: :btree

  create_table "legislative_files", force: :cascade do |t|
    t.string   "number"
    t.integer  "sheets",       default: 0, null: false
    t.integer  "bis",          default: 0
    t.text     "topic"
    t.text     "observations"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.date     "date"
    t.integer  "year"
  end

  create_table "legislative_files_procedures", force: :cascade do |t|
    t.integer "legislative_file_id"
    t.integer "procedure_id"
  end

  add_index "legislative_files_procedures", ["legislative_file_id"], name: "index_legislative_files_procedures_on_legislative_file_id", using: :btree
  add_index "legislative_files_procedures", ["procedure_id"], name: "index_legislative_files_procedures_on_procedure_id", using: :btree

  create_table "legislative_files_tags", id: false, force: :cascade do |t|
    t.integer "legislative_file_id"
    t.integer "tag_id"
  end

  add_index "legislative_files_tags", ["legislative_file_id"], name: "index_legislative_files_tags_on_legislative_file_id", using: :btree
  add_index "legislative_files_tags", ["tag_id"], name: "index_legislative_files_tags_on_tag_id", using: :btree

  create_table "legislative_sessions", force: :cascade do |t|
    t.integer  "number"
    t.text     "observation"
    t.integer  "diario_de_sesion_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "session_type",        default: 0, null: false
    t.string   "place"
    t.boolean  "secret"
    t.datetime "started_at"
    t.datetime "finished_at"
  end

  add_index "legislative_sessions", ["diario_de_sesion_id"], name: "index_legislative_sessions_on_diario_de_sesion_id", using: :btree

  create_table "libros", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "digesto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "orden"
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "legislative_file_id"
    t.integer  "person_id"
    t.datetime "borrowed_at"
    t.datetime "returned_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "loans", ["legislative_file_id"], name: "index_loans_on_legislative_file_id", using: :btree
  add_index "loans", ["person_id"], name: "index_loans_on_person_id", using: :btree

  create_table "loop_ordens", force: :cascade do |t|
    t.integer  "seccion_id"
    t.integer  "sub_seccion_id"
    t.string   "destino"
    t.integer  "loop_id"
    t.integer  "orden_del_dia_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "loop_ordens", ["loop_id"], name: "index_loop_ordens_on_loop_id", using: :btree
  add_index "loop_ordens", ["orden_del_dia_id"], name: "index_loop_ordens_on_orden_del_dia_id", using: :btree

  create_table "loops", force: :cascade do |t|
    t.integer  "legislative_file_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "number",              default: 0
    t.string   "topic"
    t.date     "year"
    t.integer  "sheets",              default: 0, null: false
    t.date     "date"
    t.integer  "bis",                 default: 0
    t.string   "observations"
    t.integer  "origin_procedure_id"
  end

  add_index "loops", ["legislative_file_id"], name: "index_loops_on_legislative_file_id", using: :btree

  create_table "loops_despachos", force: :cascade do |t|
    t.integer "loop_id"
    t.integer "despacho_id"
  end

  add_index "loops_despachos", ["despacho_id"], name: "index_loops_despachos_on_despacho_id", using: :btree
  add_index "loops_despachos", ["loop_id"], name: "index_loops_despachos_on_loop_id", using: :btree

  create_table "loops_normas", id: false, force: :cascade do |t|
    t.integer "loop_id"
    t.integer "norma_id"
  end

  add_index "loops_normas", ["loop_id"], name: "index_loops_normas_on_loop_id", using: :btree
  add_index "loops_normas", ["norma_id"], name: "index_loops_normas_on_norma_id", using: :btree

  create_table "modifica_relationships", force: :cascade do |t|
    t.integer  "modifica_id"
    t.integer  "me_modifica_id"
    t.date     "desde"
    t.date     "hasta"
    t.integer  "dia"
    t.integer  "mes"
    t.integer  "anio"
    t.integer  "dia_habil"
    t.text     "observacion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "type"
    t.string   "tipo"
    t.string   "tipo_relacion"
  end

  add_index "modifica_relationships", ["me_modifica_id"], name: "index_modifica_relationships_on_me_modifica_id", using: :btree
  add_index "modifica_relationships", ["modifica_id"], name: "index_modifica_relationships_on_modifica_id", using: :btree

  create_table "municipal_gazettes", force: :cascade do |t|
    t.integer  "number"
    t.date     "release_date"
    t.integer  "law_id"
    t.integer  "upload_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "municipal_gazettes", ["law_id"], name: "index_municipal_gazettes_on_law_id", using: :btree
  add_index "municipal_gazettes", ["upload_id"], name: "index_municipal_gazettes_on_upload_id", using: :btree

  create_table "municipal_offices", force: :cascade do |t|
    t.string   "denominacion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "municipal_offices_procedures", force: :cascade do |t|
    t.integer  "municipal_office_id"
    t.integer  "procedure_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "normas", force: :cascade do |t|
    t.string   "letra"
    t.integer  "nro"
    t.integer  "bis"
    t.text     "sumario"
    t.text     "observaciones"
    t.date     "sancion"
    t.date     "entrada_vigencia"
    t.date     "finaliza_vigencia"
    t.integer  "plazo_dia"
    t.integer  "plazo_mes"
    t.integer  "plazo_anio"
    t.string   "organismo_origen"
    t.string   "type"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "legislative_file_id"
    t.integer  "tipo"
    t.text     "descripcion"
    t.integer  "anio"
    t.integer  "indice",              limit: 8
  end

  add_index "normas", ["legislative_file_id"], name: "index_normas_on_legislative_file_id", using: :btree

  create_table "normas_otra_publicacions", id: false, force: :cascade do |t|
    t.integer "norma_id"
    t.integer "otra_publicacion_id"
  end

  add_index "normas_otra_publicacions", ["norma_id"], name: "index_normas_otra_publicacions_on_norma_id", using: :btree
  add_index "normas_otra_publicacions", ["otra_publicacion_id"], name: "index_normas_otra_publicacions_on_otra_publicacion_id", using: :btree

  create_table "normas_tags", id: false, force: :cascade do |t|
    t.integer "norma_id"
    t.integer "tag_id"
  end

  add_index "normas_tags", ["norma_id"], name: "index_normas_tags_on_norma_id", using: :btree
  add_index "normas_tags", ["tag_id"], name: "index_normas_tags_on_tag_id", using: :btree

  create_table "orden_del_dia", force: :cascade do |t|
    t.integer  "nro"
    t.date     "fecha"
    t.text     "observacion"
    t.integer  "sesion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orden_del_dia", ["sesion_id"], name: "index_orden_del_dia_on_sesion_id", using: :btree

  create_table "orden_del_dia_seccions", id: false, force: :cascade do |t|
    t.integer "orden_del_dia_id"
    t.integer "seccion_id"
  end

  add_index "orden_del_dia_seccions", ["orden_del_dia_id"], name: "index_orden_del_dia_seccions_on_orden_del_dia_id", using: :btree
  add_index "orden_del_dia_seccions", ["seccion_id"], name: "index_orden_del_dia_seccions_on_seccion_id", using: :btree

  create_table "organo_de_gobiernos", force: :cascade do |t|
    t.string   "denominacion"
    t.string   "codigo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "organo_de_gobiernos_procedures", id: false, force: :cascade do |t|
    t.integer "organo_de_gobierno_id"
    t.integer "procedure_id"
  end

  add_index "organo_de_gobiernos_procedures", ["organo_de_gobierno_id"], name: "index_organo_de_gobiernos_procedures_on_organo_de_gobierno_id", using: :btree
  add_index "organo_de_gobiernos_procedures", ["procedure_id"], name: "index_organo_de_gobiernos_procedures_on_procedure_id", using: :btree

  create_table "otra_publicacions", force: :cascade do |t|
    t.string   "nombre"
    t.text     "observacion"
    t.date     "publicacion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "cuit_or_dni"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.integer  "bloque_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "type"
    t.string   "position"
    t.datetime "withdrawn"
    t.integer  "picture_id"
  end

  add_index "people", ["bloque_id"], name: "index_people_on_bloque_id", using: :btree
  add_index "people", ["picture_id"], name: "index_people_on_picture_id", using: :btree

  create_table "people_periodos", id: false, force: :cascade do |t|
    t.integer "concejal_id"
    t.integer "periodo_id"
  end

  add_index "people_periodos", ["concejal_id"], name: "index_people_periodos_on_concejal_id", using: :btree
  add_index "people_periodos", ["periodo_id"], name: "index_people_periodos_on_periodo_id", using: :btree

  create_table "people_procedures", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "procedure_id"
  end

  add_index "people_procedures", ["person_id"], name: "index_people_procedures_on_person_id", using: :btree
  add_index "people_procedures", ["procedure_id"], name: "index_people_procedures_on_procedure_id", using: :btree

  create_table "periodos", force: :cascade do |t|
    t.date     "desde"
    t.date     "hasta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periodos_personas", id: false, force: :cascade do |t|
    t.integer "concejal_id"
    t.integer "periodo_id"
  end

  add_index "periodos_personas", ["concejal_id"], name: "index_periodos_personas_on_concejal_id", using: :btree
  add_index "periodos_personas", ["periodo_id"], name: "index_periodos_personas_on_periodo_id", using: :btree

  create_table "personals", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "nro_doc"
    t.string   "telefono"
    t.string   "email"
    t.string   "domicilio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "tipo_doc"
    t.string   "nro_doc"
    t.string   "telefono"
    t.string   "email"
    t.string   "domicilio"
    t.integer  "cargo"
    t.integer  "bloque_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.integer  "cuit"
  end

  add_index "personas", ["bloque_id"], name: "index_personas_on_bloque_id", using: :btree

  create_table "personas_tramites", id: false, force: :cascade do |t|
    t.integer "persona_id"
    t.integer "tramite_id"
  end

  add_index "personas_tramites", ["persona_id"], name: "index_personas_tramites_on_persona_id", using: :btree
  add_index "personas_tramites", ["tramite_id"], name: "index_personas_tramites_on_tramite_id", using: :btree

  create_table "procedure_derivations", force: :cascade do |t|
    t.integer  "procedure_id"
    t.integer  "area_id"
    t.datetime "derived_at"
    t.datetime "received_at"
    t.integer  "derived_by"
    t.integer  "received_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "procedure_derivations", ["area_id"], name: "index_procedure_derivations_on_area_id", using: :btree
  add_index "procedure_derivations", ["derived_by"], name: "index_procedure_derivations_on_derived_by", using: :btree
  add_index "procedure_derivations", ["procedure_id"], name: "index_procedure_derivations_on_procedure_id", using: :btree
  add_index "procedure_derivations", ["received_by"], name: "index_procedure_derivations_on_received_by", using: :btree

  create_table "procedure_signatories", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.text     "contact_info"
    t.text     "position"
    t.integer  "ranking",        default: 0
    t.integer  "initiator_type"
    t.boolean  "default",        default: false
    t.date     "leave_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedure_states", force: :cascade do |t|
    t.string   "nombre"
    t.text     "especificacion"
    t.string   "tipo"
    t.integer  "procedure_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "ref_id"
    t.string   "ref_type"
  end

  add_index "procedure_states", ["procedure_id"], name: "index_procedure_states_on_procedure_id", using: :btree
  add_index "procedure_states", ["ref_id"], name: "index_procedure_states_on_ref_id", using: :btree

  create_table "procedures", force: :cascade do |t|
    t.integer  "sheets"
    t.text     "topic"
    t.text     "observations"
    t.string   "type"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "fecha"
    t.integer  "loop_id"
    t.integer  "day"
    t.integer  "month"
    t.integer  "year"
    t.integer  "contingency_plan_id"
    t.integer  "procedure_derivation_id"
    t.integer  "legislative_file_originated_id"
  end

  add_index "procedures", ["contingency_plan_id"], name: "index_procedures_on_contingency_plan_id", using: :btree
  add_index "procedures", ["legislative_file_originated_id"], name: "index_procedures_on_legislative_file_originated_id", using: :btree
  add_index "procedures", ["loop_id"], name: "index_procedures_on_loop_id", using: :btree

  create_table "procedures_reparticion_oficials", id: false, force: :cascade do |t|
    t.integer "reparticion_oficial_id"
    t.integer "procedure_id"
  end

  add_index "procedures_reparticion_oficials", ["procedure_id"], name: "index_procedures_reparticion_oficials_on_procedure_id", using: :btree
  add_index "procedures_reparticion_oficials", ["reparticion_oficial_id"], name: "index_procedures_reparticion_oficials_on_reparticion_oficial_id", using: :btree

  create_table "processes_signatories", force: :cascade do |t|
    t.integer  "procedure_id"
    t.integer  "procedure_signatory_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "processes_signatories", ["procedure_id"], name: "index_processes_signatories_on_procedure_id", using: :btree
  add_index "processes_signatories", ["procedure_signatory_id"], name: "index_processes_signatories_on_procedure_signatory_id", using: :btree

  create_table "relationship_concejals", force: :cascade do |t|
    t.integer  "suplente_id"
    t.integer  "titular_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationship_concejals", ["suplente_id"], name: "index_relationship_concejals_on_suplente_id", using: :btree
  add_index "relationship_concejals", ["titular_id"], name: "index_relationship_concejals_on_titular_id", using: :btree

  create_table "reparticion_oficials", force: :cascade do |t|
    t.string   "denominacion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "activities", default: [],              array: true
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "seccions", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_seccions", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "seccion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sub_seccions", ["seccion_id"], name: "index_sub_seccions_on_seccion_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titulos", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "libro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "orden"
  end

  create_table "uploads", force: :cascade do |t|
    t.integer  "procedure_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "legislative_file_id"
    t.integer  "law_id"
  end

  add_index "uploads", ["law_id"], name: "index_uploads_on_law_id", using: :btree
  add_index "uploads", ["legislative_file_id"], name: "index_uploads_on_legislative_file_id", using: :btree
  add_index "uploads", ["procedure_id"], name: "index_uploads_on_procedure_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "person_id"
    t.integer  "personal_id"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree
  add_index "users", ["personal_id"], name: "index_users_on_personal_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "persona_id"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["persona_id"], name: "index_usuarios_on_persona_id", using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "laws", "legislative_sessions"
  add_foreign_key "legislative_file_states", "legislative_files"
  add_foreign_key "legislative_file_states", "legislative_sessions"
  add_foreign_key "legislative_file_states", "procedures"
  add_foreign_key "municipal_gazettes", "laws"
  add_foreign_key "municipal_gazettes", "uploads"
  add_foreign_key "municipal_offices_procedures", "municipal_offices"
  add_foreign_key "municipal_offices_procedures", "procedures"
  add_foreign_key "procedure_derivations", "areas"
  add_foreign_key "procedure_derivations", "procedures"
  add_foreign_key "procedures", "contingency_plans"
  add_foreign_key "procedures", "procedure_derivations"
end
