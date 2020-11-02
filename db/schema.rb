# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_02_085415) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "post_id"
    t.string "text", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "horses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "name", null: false
    t.integer "horsegender_id", null: false
    t.integer "age_id", null: false
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "post_id"
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.string "grade"
    t.string "terms", null: false
    t.date "day", null: false
    t.string "horse1"
    t.string "horse2"
    t.string "horse3"
    t.string "horse4"
    t.string "horse5"
    t.string "horse6"
    t.string "horse7"
    t.string "horse8"
    t.string "horse9"
    t.string "horse10"
    t.string "horse11"
    t.string "horse12"
    t.string "horse13"
    t.string "horse14"
    t.string "horse15"
    t.string "horse16"
    t.string "horse17"
    t.string "horse18"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "text", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "races", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.date "day", null: false
    t.string "place", null: false
    t.string "racetrack", null: false
    t.string "horse1", null: false
    t.string "horse2"
    t.string "horse3"
    t.string "horse4"
    t.string "horse5"
    t.string "horse6"
    t.string "horse7"
    t.string "horse8"
    t.string "horse9"
    t.string "horse10"
    t.string "horse11"
    t.string "horse12"
    t.string "horse13"
    t.string "horse14"
    t.string "horse15"
    t.string "horse16"
    t.string "horse17"
    t.string "horse18"
  end

  create_table "raps", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pace", null: false
    t.string "m200"
    t.string "m400"
    t.string "m600"
    t.string "m800"
    t.string "m1000"
    t.string "m1200"
    t.string "m1400"
    t.string "m1600"
    t.string "m1800"
    t.string "m2000"
    t.string "m2200"
    t.string "m2400"
    t.string "m2600"
    t.string "m2800"
    t.string "m3000"
    t.string "m3200"
    t.bigint "race_id"
    t.index ["race_id"], name: "index_raps_on_race_id"
  end

  create_table "schedules", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.date "day", null: false
    t.string "place", null: false
    t.string "length"
    t.string "horse1"
    t.string "horse2"
    t.string "horse3"
    t.string "horse4"
    t.string "horse5"
    t.string "horse6"
    t.string "horse7"
    t.string "horse8"
    t.string "horse9"
    t.string "horse10"
    t.string "horse11"
    t.string "horse12"
    t.string "horse13"
    t.string "horse14"
    t.string "horse15"
    t.string "horse16"
    t.string "horse17"
    t.string "horse18"
  end

  create_table "surveys", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title", null: false
    t.string "item1", null: false
    t.string "item2", null: false
    t.string "item3"
    t.string "item4"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.text "profile"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "select", null: false
    t.bigint "user_id"
    t.bigint "survey_id"
    t.index ["survey_id"], name: "index_votes_on_survey_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "raps", "races"
  add_foreign_key "surveys", "users"
  add_foreign_key "votes", "surveys"
  add_foreign_key "votes", "users"
end
