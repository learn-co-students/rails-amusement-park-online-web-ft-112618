ActiveRecord::Schema.define(version: 2019_02_20_202732) do

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.integer "min_height"
    t.integer "nausea_rating"
    t.integer "happiness_rating"
    t.integer "tickets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.integer "user_id"
    t.integer "attraction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "happiness"
    t.integer "nausea"
    t.integer "height"
    t.integer "tickets"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
