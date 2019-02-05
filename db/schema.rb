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

ActiveRecord::Schema.define(version: 2019_02_05_163328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asistencia_empresas_responses", force: :cascade do |t|
    t.decimal "exp_pob"
    t.decimal "problematica"
    t.decimal "formacion"
    t.decimal "experiencia"
    t.decimal "claridad"
    t.decimal "viabilidad"
    t.decimal "formativo"
    t.bigint "evaluation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_id"], name: "index_asistencia_empresas_responses_on_evaluation_id"
  end

  create_table "calls", force: :cascade do |t|
    t.string "nombre"
    t.string "centro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "publico"
    t.string "modalidad"
  end

  create_table "emprendedores_capacitaciones_responses", force: :cascade do |t|
    t.decimal "propuesta"
    t.decimal "antecedentes"
    t.decimal "conocimiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas_capacitaciones_responses", force: :cascade do |t|
    t.decimal "formacion_titulo"
    t.decimal "estudios"
    t.decimal "formacion_equipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "antecedentes_formacion"
    t.decimal "antecedentes_territorio"
    t.decimal "experiencia_tecno"
    t.decimal "desarrollo"
    t.decimal "pertinencia"
    t.decimal "objetivo"
    t.decimal "metodologia"
    t.decimal "perfil"
    t.decimal "innovacion"
    t.decimal "materiales"
    t.decimal "actividades"
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "proposal_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "evaluatable_id"
    t.string "evaluatable_type"
    t.index ["proposal_id"], name: "index_evaluations_on_proposal_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "proveedor"
    t.bigint "call_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["call_id"], name: "index_proposals_on_call_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "institucion"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "asistencia_empresas_responses", "evaluations"
  add_foreign_key "evaluations", "proposals"
  add_foreign_key "evaluations", "users"
  add_foreign_key "proposals", "calls"
end
