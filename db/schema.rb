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

ActiveRecord::Schema.define(version: 20170914051838) do

  create_table "id_of_bulletinboards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "did"
    t.integer  "rid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iizuka_calls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535, null: false
    t.string   "title"
    t.datetime "date"
    t.text     "content",    limit: 65535
    t.string   "department"
    t.string   "grade"
    t.string   "note"
    t.string   "finish"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["date"], name: "index_iizuka_calls_on_date", using: :btree
    t.index ["url"], name: "index_iizuka_calls_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "iizuka_homepages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535, null: false
    t.integer  "board_id",                 null: false, unsigned: true
    t.datetime "date"
    t.text     "place",      limit: 65535
    t.text     "content",    limit: 65535
    t.text     "note",       limit: 65535
    t.text     "inquiry",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["date"], name: "index_iizuka_homepages_on_date", using: :btree
    t.index ["url"], name: "index_iizuka_homepages_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "iizuka_intensive_lectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",              limit: 65535, null: false
    t.string   "title"
    t.datetime "date"
    t.text     "content",          limit: 65535
    t.string   "note"
    t.string   "attachment_1"
    t.text     "attachment_1_url", limit: 65535
    t.string   "attachment_2"
    t.text     "attachment_2_url", limit: 65535
    t.string   "attachment_3"
    t.text     "attachment_3_url", limit: 65535
    t.string   "attachment_4"
    t.text     "attachment_4_url", limit: 65535
    t.string   "attachment_5"
    t.text     "attachment_5_url", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["date"], name: "index_iizuka_intensive_lectures_on_date", using: :btree
    t.index ["url"], name: "index_iizuka_intensive_lectures_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "iizuka_lectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",              limit: 65535, null: false
    t.integer  "board_id",                       null: false, unsigned: true
    t.string   "title"
    t.string   "subject"
    t.datetime "date"
    t.string   "period"
    t.string   "responsibility"
    t.string   "place_or_before"
    t.string   "after"
    t.text     "content",          limit: 65535
    t.string   "department"
    t.string   "grade"
    t.string   "note"
    t.string   "attachment_1"
    t.text     "attachment_1_url", limit: 65535
    t.string   "attachment_2"
    t.text     "attachment_2_url", limit: 65535
    t.string   "attachment_3"
    t.text     "attachment_3_url", limit: 65535
    t.string   "attachment_4"
    t.text     "attachment_4_url", limit: 65535
    t.string   "attachment_5"
    t.text     "attachment_5_url", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["date"], name: "index_iizuka_lectures_on_date", using: :btree
    t.index ["url"], name: "index_iizuka_lectures_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "iizuka_notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",              limit: 65535, null: false
    t.string   "title"
    t.datetime "date"
    t.string   "period"
    t.string   "place_or_before"
    t.text     "content",          limit: 65535
    t.string   "department"
    t.string   "grade"
    t.string   "attachment_1"
    t.text     "attachment_1_url", limit: 65535
    t.string   "attachment_2"
    t.text     "attachment_2_url", limit: 65535
    t.string   "attachment_3"
    t.text     "attachment_3_url", limit: 65535
    t.string   "attachment_4"
    t.text     "attachment_4_url", limit: 65535
    t.string   "attachment_5"
    t.text     "attachment_5_url", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["date"], name: "index_iizuka_notices_on_date", using: :btree
    t.index ["url"], name: "index_iizuka_notices_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "iizuka_others", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",              limit: 65535, null: false
    t.integer  "board_id",                       null: false, unsigned: true
    t.string   "title"
    t.datetime "date"
    t.string   "responsibility"
    t.text     "content",          limit: 65535
    t.string   "note"
    t.string   "attachment_1"
    t.text     "attachment_1_url", limit: 65535
    t.string   "attachment_2"
    t.text     "attachment_2_url", limit: 65535
    t.string   "attachment_3"
    t.text     "attachment_3_url", limit: 65535
    t.string   "attachment_4"
    t.text     "attachment_4_url", limit: 65535
    t.string   "attachment_5"
    t.text     "attachment_5_url", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["date"], name: "index_iizuka_others_on_date", using: :btree
    t.index ["url"], name: "index_iizuka_others_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "iizuka_scholarships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",              limit: 65535, null: false
    t.string   "title"
    t.datetime "date"
    t.text     "content",          limit: 65535
    t.string   "note"
    t.string   "attachment_1"
    t.text     "attachment_1_url", limit: 65535
    t.string   "attachment_2"
    t.text     "attachment_2_url", limit: 65535
    t.string   "finish"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["date"], name: "index_iizuka_scholarships_on_date", using: :btree
    t.index ["url"], name: "index_iizuka_scholarships_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "iizuka_studying_abroads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",              limit: 65535, null: false
    t.string   "title"
    t.datetime "date"
    t.string   "responsibility"
    t.text     "content",          limit: 65535
    t.string   "attachment_1"
    t.text     "attachment_1_url", limit: 65535
    t.string   "attachment_2"
    t.text     "attachment_2_url", limit: 65535
    t.string   "attachment_3"
    t.text     "attachment_3_url", limit: 65535
    t.string   "attachment_4"
    t.text     "attachment_4_url", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["date"], name: "index_iizuka_studying_abroads_on_date", using: :btree
    t.index ["url"], name: "index_iizuka_studying_abroads_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "intermediates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "subject_id",                  unsigned: true
    t.integer  "week_period_id",              unsigned: true
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "campus_id",                                 unsigned: true
    t.text     "url",            limit: 65535
    t.integer  "year"
    t.string   "name"
    t.integer  "code"
    t.string   "teacher"
    t.text     "department",     limit: 65535
    t.string   "classification"
    t.string   "num_of_unit"
    t.string   "grade"
    t.integer  "term",                                      unsigned: true
    t.string   "number"
    t.string   "place"
    t.datetime "updated"
    t.text     "outline",        limit: 65535
    t.text     "placement",      limit: 65535
    t.text     "item",           limit: 65535
    t.text     "procedure",      limit: 65535
    t.text     "goal",           limit: 65535
    t.text     "criteria",       limit: 65535
    t.text     "preparation",    limit: 65535
    t.text     "keyword",        limit: 65535
    t.text     "textbook",       limit: 65535
    t.text     "reference",      limit: 65535
    t.text     "note",           limit: 65535
    t.text     "email",          limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["code"], name: "index_subjects_on_code", unique: true, using: :btree
    t.index ["url"], name: "index_subjects_on_url", unique: true, length: { url: 256 }, using: :btree
  end

  create_table "week_periods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "week_num",                unsigned: true
    t.integer  "period_num",              unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
