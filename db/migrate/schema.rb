

 ActiveRecord::Schema.define(version: 2019_02_25_011458) do

   create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.integer "tickets"
    t.integer "nausea_rating"
    t.integer "happiness_rating"
    t.integer "min_height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

   create_table "rides", force: :cascade do |t|
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_rides_on_attraction_id"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

   create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "happiness"
    t.integer "tickets"
    t.integer "height"
    t.integer "nausea"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

 end
