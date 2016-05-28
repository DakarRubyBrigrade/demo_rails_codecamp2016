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

ActiveRecord::Schema.define(version: 20160527122814) do

  create_table "ateliers", force: :cascade do |t|
    t.string   "titre",        limit: 255
    t.string   "presente_par", limit: 255
    t.string   "entreprise",   limit: 255
    t.integer  "salle_id",     limit: 4
    t.time     "heure_debut"
    t.time     "heure_fin"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "ateliers", ["salle_id"], name: "index_ateliers_on_salle_id", using: :btree

  create_table "salles", force: :cascade do |t|
    t.string   "nom",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "ateliers", "salles"
end
