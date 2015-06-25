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

ActiveRecord::Schema.define(version: 20150625143804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloques", force: :cascade do |t|
    t.text     "denominacion"
    t.text     "codigo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "bloques_periodos", id: false, force: :cascade do |t|
    t.integer "bloque_id"
    t.integer "periodo_id"
  end

  add_index "bloques_periodos", ["bloque_id"], name: "index_bloques_periodos_on_bloque_id", using: :btree
  add_index "bloques_periodos", ["periodo_id"], name: "index_bloques_periodos_on_periodo_id", using: :btree

  create_table "comisions", force: :cascade do |t|
    t.string   "denominacion"
    t.string   "codigo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "comisions_periodos", id: false, force: :cascade do |t|
    t.integer "comision_id"
    t.integer "periodo_id"
  end

  add_index "comisions_periodos", ["comision_id"], name: "index_comisions_periodos_on_comision_id", using: :btree
  add_index "comisions_periodos", ["periodo_id"], name: "index_comisions_periodos_on_periodo_id", using: :btree

  create_table "dependencia_municipals", force: :cascade do |t|
    t.string   "denominacion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "periodos", force: :cascade do |t|
    t.date     "desde"
    t.date     "hasta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios_rols", id: false, force: :cascade do |t|
    t.integer "usuario_id"
    t.integer "rol_id"
  end

  add_index "usuarios_rols", ["rol_id"], name: "index_usuarios_rols_on_rol_id", using: :btree
  add_index "usuarios_rols", ["usuario_id"], name: "index_usuarios_rols_on_usuario_id", using: :btree

end
