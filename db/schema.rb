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

ActiveRecord::Schema.define(version: 2019_08_27_211615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bought_lists", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tariff"
    t.index ["user_id"], name: "index_bought_lists_on_user_id"
  end

  create_table "course_translations", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["course_id"], name: "index_course_translations_on_course_id"
    t.index ["locale"], name: "index_course_translations_on_locale"
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document"
    t.string "trailer"
    t.string "image"
    t.boolean "published", default: false
  end

  create_table "lesson_translations", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["lesson_id"], name: "index_lesson_translations_on_lesson_id"
    t.index ["locale"], name: "index_lesson_translations_on_locale"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "video"
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rate_translations", force: :cascade do |t|
    t.bigint "rate_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.integer "price"
    t.index ["locale"], name: "index_rate_translations_on_locale"
    t.index ["rate_id"], name: "index_rate_translations_on_rate_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "tariff"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bought_count", default: 0
    t.index ["course_id"], name: "index_rates_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watched_lists", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "course_id"
    t.integer "lesson_id"
    t.boolean "watch", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "watched", default: false
    t.index ["user_id"], name: "index_watched_lists_on_user_id"
  end

  create_table "welcomes", force: :cascade do |t|
    t.string "header1"
    t.string "content1"
    t.string "header2"
    t.string "content2"
    t.string "header3"
    t.string "for_you1"
    t.string "for_you2"
    t.string "for_you3"
    t.string "for_you4"
    t.string "for_you5"
    t.string "for_you6"
    t.string "content3"
    t.string "header4"
    t.string "content4"
    t.string "header5"
    t.string "content5"
    t.string "header6"
    t.string "header7"
    t.string "content6"
    t.string "price"
    t.string "time"
    t.string "client_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lessons", "courses"
  add_foreign_key "rates", "courses"
  add_foreign_key "watched_lists", "users"
end
