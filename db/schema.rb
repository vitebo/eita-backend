# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema[7.0].define(version: 2023_08_19_215142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "vector"

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "kind"
    t.text "raw_body"
    t.text "body"
    t.json "embedding"
    t.string "updated_at", limit: 50
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.json "embeddings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_tags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_users_tags_on_tag_id"
    t.index ["user_id"], name: "index_users_tags_on_user_id"
  end

  add_foreign_key "users_tags", "tags"
  add_foreign_key "users_tags", "users"
end
