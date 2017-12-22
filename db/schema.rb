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

ActiveRecord::Schema.define(version: 20171219020309) do

  create_table "avaliacos", force: :cascade do |t|
    t.float "avaliacao", null: false
    t.integer "avaliado_id", null: false
    t.integer "avaliador_id", null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.text "cometario", null: false
    t.integer "misso_id", null: false
    t.integer "pessoa_id", null: false
  end

  create_table "equipes", force: :cascade do |t|
    t.string "nomeEq", limit: 30, null: false
    t.float "mediaEq"
    t.integer "mb_1_id", null: false
    t.integer "mb_2_id", null: false
    t.integer "mb_3_id", null: false
    t.integer "mb_S_id", null: false
    t.index ["nomeEq"], name: "sqlite_autoindex_equipes_1", unique: true
  end

  create_table "missos", force: :cascade do |t|
    t.string "nome", limit: 30, null: false
    t.string "local", limit: 70, null: false
    t.integer "nv_dific_id"
    t.integer "equipe_id"
    t.integer "pessoa_id"
    t.float "preco"
  end

  create_table "nv_difics", force: :cascade do |t|
    t.string "nivel", limit: 2, null: false
    t.float "preco", null: false
    t.index ["nivel"], name: "sqlite_autoindex_nv_difics_1", unique: true
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome", limit: 50, null: false
    t.integer "identidade", null: false
    t.integer "telefone"
    t.date "dataNasc"
    t.string "endereco", limit: 80
    t.integer "rk_ninja_id", null: false
    t.integer "tp_user_id"
    t.string "user_name", limit: 30, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.float "mediaAv", default: 0.0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_pessoas_on_email", unique: true
    t.index ["identidade"], name: "sqlite_autoindex_pessoas_1", unique: true
    t.index ["nome"], name: "index_pessoas_on_nome", unique: true
    t.index ["reset_password_token"], name: "index_pessoas_on_reset_password_token", unique: true
    t.index ["user_name"], name: "sqlite_autoindex_pessoas_2", unique: true
  end

  create_table "rk_ninjas", force: :cascade do |t|
    t.string "rank", limit: 20, null: false
    t.index ["rank"], name: "sqlite_autoindex_rk_ninjas_1", unique: true
  end

  create_table "tp_users", force: :cascade do |t|
    t.string "tipo", limit: 20, null: false
    t.index ["tipo"], name: "sqlite_autoindex_tp_users_1", unique: true
  end

end
