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

ActiveRecord::Schema.define(version: 20140731214207) do

  create_table "courses", force: true do |t|
    t.string   "title"
    t.integer  "year_abroad?"
    t.string   "kisid"
    t.float    "satisfaction"
    t.string   "offer"
    t.integer  "salary_40m"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
    t.string   "jacs"
    t.integer  "salary_6m_raw"
    t.float    "salary_6m"
    t.integer  "fee_raw"
    t.float    "fee"
    t.float    "work_study"
    t.string   "ucas"
    t.float    "explanation_quality"
    t.float    "interesting"
    t.float    "enthusiastic"
    t.float    "intellectually_stimulating"
    t.float    "prompt_feedback"
    t.float    "library"
    t.float    "accessible_it"
    t.float    "accessible_equipment"
    t.float    "confidence"
    t.float    "supervised_time"
    t.float    "assessment_by_cw"
    t.integer  "mode"
    t.text     "url"
  end

  add_index "courses", ["university_id"], name: "index_courses_on_university_id"

  create_table "elo_scores", force: true do |t|
    t.integer "score"
    t.integer "university_id"
    t.integer "user_id"
  end

  create_table "questions", force: true do |t|
    t.string   "text"
    t.string   "question_type"
    t.integer  "order"
    t.string   "identifier"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: true do |t|
    t.string   "ukprn"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location"
    t.integer  "private_accomodation_q3"
    t.integer  "private_accomodation_q1"
    t.integer  "public_accomodation_q3"
    t.integer  "public_accomodation_q1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "image_url"
    t.text     "description"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.text     "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
