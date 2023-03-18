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

ActiveRecord::Schema.define(version: 2023_03_18_015454) do

  create_table "assignments", force: :cascade do |t|
    t.string "course"
    t.string "assignment_type"
    t.datetime "due_date"
    t.boolean "submitted"
    t.boolean "on_time"
    t.integer "score"
    t.string "notes"
    t.integer "student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "student_pic"
    t.string "gender"
    t.integer "age"
    t.datetime "birthday"
    t.string "academic_standing"
    t.string "hobby"
    t.string "allergies"
    t.string "e_contact_name"
    t.string "e_contact_relationship"
    t.string "e_contact_number"
  end

end
