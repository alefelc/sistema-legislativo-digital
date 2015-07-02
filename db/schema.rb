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

ActiveRecord::Schema.define(version: 20150702140530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloques", force: :cascade do |t|
    t.text     "denominacion"
    t.text     "codigo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "vice"
    t.integer  "presidente"
  end

  create_table "bloques_periodos", id: false, force: :cascade do |t|
    t.integer "bloque_id"
    t.integer "periodo_id"
  end

  add_index "bloques_periodos", ["bloque_id"], name: "index_bloques_periodos_on_bloque_id", using: :btree
  add_index "bloques_periodos", ["periodo_id"], name: "index_bloques_periodos_on_periodo_id", using: :btree

  create_table "bloques_tramites", id: false, force: :cascade do |t|
    t.integer "bloque_id"
    t.integer "tramite_id"
  end

  add_index "bloques_tramites", ["bloque_id"], name: "index_bloques_tramites_on_bloque_id", using: :btree
  add_index "bloques_tramites", ["tramite_id"], name: "index_bloques_tramites_on_tramite_id", using: :btree

  create_table "comisions", force: :cascade do |t|
    t.string   "denominacion"
    t.string   "codigo"
    t.integer  "despacho_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comisions", ["despacho_id"], name: "index_comisions_on_despacho_id", using: :btree

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

  create_table "documentacion_presentadas", force: :cascade do |t|
    t.string   "tipo"
    t.integer  "condonacion_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "documentacion_presentadas", ["condonacion_id"], name: "index_documentacion_presentadas_on_condonacion_id", using: :btree

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
    t.integer  "despacho_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "type"
  end

  add_index "personas", ["bloque_id"], name: "index_personas_on_bloque_id", using: :btree
  add_index "personas", ["despacho_id"], name: "index_personas_on_despacho_id", using: :btree

  create_table "personas_tramites", id: false, force: :cascade do |t|
    t.integer "persona_id"
    t.integer "tramite_id"
  end

  add_index "personas_tramites", ["persona_id"], name: "index_personas_tramites_on_persona_id", using: :btree
  add_index "personas_tramites", ["tramite_id"], name: "index_personas_tramites_on_tramite_id", using: :btree

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

  create_table "tramites", force: :cascade do |t|
    t.integer  "nro_fojas"
    t.text     "asunto"
    t.integer  "responsable"
    t.integer  "tipo_contribucion"
    t.integer  "condicion_contribuyente"
    t.text     "observaciones"
    t.string   "type"
    t.integer  "comision_id"
    t.integer  "concejal_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "tramites", ["comision_id"], name: "index_tramites_on_comision_id", using: :btree
  add_index "tramites", ["concejal_id"], name: "index_tramites_on_concejal_id", using: :btree

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
