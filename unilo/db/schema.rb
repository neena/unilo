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

ActiveRecord::Schema.define(version: 20140728143732) do

  create_table "courses", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.integer  "year_abroad?"
    t.string   "kisid"
    t.integer  "fee"
    t.float    "satisfaction"
    t.string   "offer"
    t.integer  "salary_6m"
    t.integer  "salary_40m"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
  end

  add_index "courses", ["university_id"], name: "index_courses_on_university_id"

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
  end

end
