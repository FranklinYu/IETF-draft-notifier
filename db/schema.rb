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

ActiveRecord::Schema.define(version: 2019_05_12_204427) do

  create_table "ietf_drafts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "version", null: false
    t.integer "successor_id"
    t.integer "rfc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["successor_id"], name: "index_ietf_drafts_on_successor_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email"
    t.integer "ietf_draft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ietf_draft_id"], name: "index_subscriptions_on_ietf_draft_id"
  end

end
