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

ActiveRecord::Schema.define(version: 20180131220604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "lessons", force: :cascade do |t|
    t.bigint "skill_id"
    t.string "name"
    t.string "description"
    t.boolean "completed"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.date "date"
    t.string "status"
    t.integer "price_cents", default: 0, null: false
    t.string "charge_id"
    t.index ["skill_id"], name: "index_lessons_on_skill_id"
    t.index ["student_id"], name: "index_lessons_on_student_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "message_text"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
    t.index ["skill_id"], name: "index_messages_on_skill_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "skill_id"
    t.bigint "student_id"
    t.index ["skill_id"], name: "index_reviews_on_skill_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "availability"
    t.string "category"
    t.string "skill_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.string "location"
    t.float "latitude"
    t.float "longitude"
    t.string "formatted_address"
    t.integer "price_cents", default: 0, null: false
    t.index ["teacher_id"], name: "index_skills_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teacher_rating"
    t.string "photo"
    t.text "bio"
    t.string "role"
    t.string "phone"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "lessons", "skills"
  add_foreign_key "lessons", "users", column: "student_id"
  add_foreign_key "messages", "skills"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "reviews", "skills"
  add_foreign_key "reviews", "users", column: "student_id"
  add_foreign_key "skills", "users", column: "teacher_id"
end
