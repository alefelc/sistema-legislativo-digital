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

ActiveRecord::Schema.define(version: 20150824133559) do

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

  create_table "admin_users", force: :cascade do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

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

  create_table "bloques_tramites", id: false, force: :cascade do |t|
    t.integer "bloque_id"
    t.integer "tramite_id"
  end

  add_index "bloques_tramites", ["bloque_id"], name: "index_bloques_tramites_on_bloque_id", using: :btree
  add_index "bloques_tramites", ["tramite_id"], name: "index_bloques_tramites_on_tramite_id", using: :btree

  create_table "boletin_oficials", force: :cascade do |t|
    t.integer  "nro"
    t.date     "publicacion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "boletin_oficials_normas", id: false, force: :cascade do |t|
    t.integer "boletin_oficial_id"
    t.integer "norma_id"
  end

  add_index "boletin_oficials_normas", ["boletin_oficial_id"], name: "index_boletin_oficials_normas_on_boletin_oficial_id", using: :btree
  add_index "boletin_oficials_normas", ["norma_id"], name: "index_boletin_oficials_normas_on_norma_id", using: :btree

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

  create_table "circuito_ordens", force: :cascade do |t|
    t.integer  "seccion_id"
    t.integer  "sub_seccion_id"
    t.string   "destino"
    t.integer  "circuito_id"
    t.integer  "orden_del_dia_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "circuito_ordens", ["circuito_id"], name: "index_circuito_ordens_on_circuito_id", using: :btree
  add_index "circuito_ordens", ["orden_del_dia_id"], name: "index_circuito_ordens_on_orden_del_dia_id", using: :btree

  create_table "circuitos", force: :cascade do |t|
    t.integer  "expediente_id"
    t.integer  "tramite_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "nro"
  end

  add_index "circuitos", ["expediente_id"], name: "index_circuitos_on_expediente_id", using: :btree
  add_index "circuitos", ["tramite_id"], name: "index_circuitos_on_tramite_id", using: :btree

  create_table "circuitos_normas", id: false, force: :cascade do |t|
    t.integer "circuito_id"
    t.integer "norma_id"
  end

  add_index "circuitos_normas", ["circuito_id"], name: "index_circuitos_normas_on_circuito_id", using: :btree
  add_index "circuitos_normas", ["norma_id"], name: "index_circuitos_normas_on_norma_id", using: :btree

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

  create_table "comisions_tramites", id: false, force: :cascade do |t|
    t.integer "comision_id"
    t.integer "tramite_id"
  end

  add_index "comisions_tramites", ["comision_id"], name: "index_comisions_tramites_on_comision_id", using: :btree
  add_index "comisions_tramites", ["tramite_id"], name: "index_comisions_tramites_on_tramite_id", using: :btree

  create_table "dependencia_municipals", force: :cascade do |t|
    t.string   "denominacion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "despachos_concejals", id: false, force: :cascade do |t|
    t.integer "despacho_id"
    t.integer "concejal_id"
  end

  add_index "despachos_concejals", ["concejal_id"], name: "index_despachos_concejals_on_concejal_id", using: :btree
  add_index "despachos_concejals", ["despacho_id"], name: "index_despachos_concejals_on_despacho_id", using: :btree

  create_table "destinos", force: :cascade do |t|
    t.integer  "tipo"
    t.date     "fecha"
    t.string   "destino"
    t.integer  "norma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "estado_expedientes", force: :cascade do |t|
    t.string   "nombre"
    t.text     "especificacion1"
    t.text     "especificacion2"
    t.string   "tipo"
    t.integer  "circuito_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "ref_id"
    t.string   "ref_type"
    t.date     "fecha"
  end

  add_index "estado_expedientes", ["circuito_id"], name: "index_estado_expedientes_on_circuito_id", using: :btree
  add_index "estado_expedientes", ["ref_type", "ref_id"], name: "index_estado_expedientes_on_ref_type_and_ref_id", using: :btree

  create_table "estado_tramites", force: :cascade do |t|
    t.string   "nombre"
    t.text     "especificacion"
    t.string   "tipo"
    t.integer  "tramite_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "ref_id"
    t.string   "ref_type"
  end

  add_index "estado_tramites", ["ref_id"], name: "index_estado_tramites_on_ref_id", using: :btree
  add_index "estado_tramites", ["tramite_id"], name: "index_estado_tramites_on_tramite_id", using: :btree

  create_table "expediente_administrativos", force: :cascade do |t|
    t.string   "nro_exp"
    t.integer  "nro_fojas"
    t.integer  "bis"
    t.text     "tema"
    t.text     "observacion"
    t.integer  "expediente_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "sub_indice"
    t.string   "letra"
    t.date     "anio"
  end

  add_index "expediente_administrativos", ["expediente_id"], name: "index_expediente_administrativos_on_expediente_id", using: :btree

  create_table "expedientes", force: :cascade do |t|
    t.string   "nro_exp"
    t.integer  "nro_fojas"
    t.integer  "bis"
    t.text     "tema"
    t.text     "observacion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "anio"
  end

  create_table "expedientes_tags", id: false, force: :cascade do |t|
    t.integer "expediente_id"
    t.integer "tag_id"
  end

  add_index "expedientes_tags", ["expediente_id"], name: "index_expedientes_tags_on_expediente_id", using: :btree
  add_index "expedientes_tags", ["tag_id"], name: "index_expedientes_tags_on_tag_id", using: :btree

  create_table "libros", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "digesto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "orden"
  end

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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "expediente_id"
    t.integer  "tipo"
    t.text     "descripcion"
    t.integer  "anio"
    t.integer  "indice",            limit: 8
  end

  add_index "normas", ["expediente_id"], name: "index_normas_on_expediente_id", using: :btree

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

  create_table "otra_publicacions", force: :cascade do |t|
    t.string   "nombre"
    t.text     "observacion"
    t.date     "publicacion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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

  create_table "rols", force: :cascade do |t|
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols_usuarios", id: false, force: :cascade do |t|
    t.integer "usuario_id"
    t.integer "rol_id"
  end

  add_index "rols_usuarios", ["rol_id"], name: "index_rols_usuarios_on_rol_id", using: :btree
  add_index "rols_usuarios", ["usuario_id"], name: "index_rols_usuarios_on_usuario_id", using: :btree

  create_table "seccions", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sesions", force: :cascade do |t|
    t.integer  "nro"
    t.text     "observacion"
    t.string   "tipo1"
    t.string   "tipo2"
    t.integer  "diario_de_sesion_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "sesions", ["diario_de_sesion_id"], name: "index_sesions_on_diario_de_sesion_id", using: :btree

  create_table "sub_seccions", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "seccion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sub_seccions", ["seccion_id"], name: "index_sub_seccions_on_seccion_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "nombre"
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

  create_table "tramites", force: :cascade do |t|
    t.integer  "nro_fojas"
    t.text     "asunto"
    t.integer  "responsable"
    t.integer  "tipo_contribucion"
    t.integer  "condicion_contribuyente"
    t.text     "observaciones"
    t.string   "type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "expediente_id"
  end

  add_index "tramites", ["expediente_id"], name: "index_tramites_on_expediente_id", using: :btree

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

end
