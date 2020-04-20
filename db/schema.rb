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

ActiveRecord::Schema.define(version: 2020_04_20_063638) do

  create_table "menu_items", force: :cascade do |t|
    t.integer "menu_id"
    t.string "name"
    t.text "description"
    t.integer "price"
  end

  create_table "menuitems", force: :cascade do |t|
    t.integer "menu_id"
    t.string "name"
    t.text "description"
    t.integer "price"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
  end

end
