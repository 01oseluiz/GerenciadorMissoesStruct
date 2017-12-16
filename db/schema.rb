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

ActiveRecord::Schema.define(version: 0) do

  create_table "avaliacos", primary_key: "ID_avaliacao", force: :cascade do |t|
    t.float "avaliacao", null: false
    t.integer "ID_avaliado", null: false
    t.integer "ID_avaliador", null: false
  end

  create_table "comentarios", primary_key: "ID_coment", force: :cascade do |t|
    t.text "cometario", null: false
    t.integer "ID_missao", null: false
    t.integer "ID_pessoa", null: false
  end

  create_table "equipes", primary_key: "ID_equipe", force: :cascade do |t|
    t.string "nomeEq", limit: 30, null: false
    t.float "mediaEq"
    t.integer "mb_1", null: false
    t.integer "mb_2", null: false
    t.integer "mb_3", null: false
    t.integer "mb_S", null: false
    t.index ["nomeEq"], name: "sqlite_autoindex_equipes_1", unique: true
  end

  create_table "missos", primary_key: "ID_missao", force: :cascade do |t|
    t.string "nome", limit: 30, null: false
    t.string "local", limit: 70, null: false
    t.integer "ID_nv"
    t.integer "ID_equipe"
    t.integer "ID_pessoa"
    t.float "preco"
  end

  create_table "nv_difics", primary_key: "ID_nv", force: :cascade do |t|
    t.string "nivel", limit: 2, null: false
    t.float "preco", null: false
    t.index ["nivel"], name: "sqlite_autoindex_nv_difics_1", unique: true
  end

  create_table "pessoas", primary_key: "ID_pessoa", force: :cascade do |t|
    t.string "nome", limit: 50, null: false
    t.integer "identidade", null: false
    t.integer "telefone"
    t.date "dataNasc"
    t.string "endereco", limit: 80
    t.string "user_name", limit: 30, null: false
    t.string "email", limit: 40, null: false
    t.string "senha", limit: 16, null: false
    t.integer "ID_Rk", null: false
    t.integer "ID_tp", null: false
    t.float "mediaAv", default: 0.0
    t.index ["email"], name: "sqlite_autoindex_pessoas_3", unique: true
    t.index ["identidade"], name: "sqlite_autoindex_pessoas_1", unique: true
    t.index ["user_name"], name: "sqlite_autoindex_pessoas_2", unique: true
  end

  create_table "rk_ninjas", primary_key: "ID_Rk", force: :cascade do |t|
    t.string "rank", limit: 20, null: false
    t.index ["rank"], name: "sqlite_autoindex_rk_ninjas_1", unique: true
  end

  create_table "tp_users", primary_key: "ID_tp", force: :cascade do |t|
    t.string "tipo", limit: 20, null: false
    t.index ["tipo"], name: "sqlite_autoindex_tp_users_1", unique: true
  end

end
