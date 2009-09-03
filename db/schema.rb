# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090902182122) do

  create_table "courses", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "standard_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "criterions", :force => true do |t|
    t.string   "subject_id"
    t.string   "category"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "criterions_summative_tasks", :id => false, :force => true do |t|
    t.integer "criterion_id"
    t.integer "summative_task_id"
  end

  create_table "formative_tasks", :force => true do |t|
    t.string   "description"
    t.integer  "level"
    t.integer  "unit_planner_id"
    t.string   "task"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "formative_tasks_objectives", :id => false, :force => true do |t|
    t.integer "objective_id"
    t.integer "formative_task_id"
  end

  create_table "learner_profiles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learning_styles", :force => true do |t|
    t.string   "style"
    t.string   "explanation"
    t.integer  "unit_planner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "objectives", :force => true do |t|
    t.string   "subject_area"
    t.string   "category"
    t.string   "subcategory"
    t.text     "description"
    t.integer  "criterion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "objectives_unit_planners", :id => false, :force => true do |t|
    t.integer  "objective_id"
    t.integer  "unit_planner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "standards", :force => true do |t|
    t.integer  "subject_id"
    t.string   "label"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "summative_tasks", :force => true do |t|
    t.integer  "unit_planner_id"
    t.string   "description"
    t.integer  "level"
    t.string   "task"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_planners", :force => true do |t|
    t.integer  "subject_id"
    t.string   "subject_area"
    t.string   "course"
    t.string   "blooms_level"
    t.string   "unit_topic"
    t.string   "unit_title"
    t.string   "teachers"
    t.string   "time_frame"
    t.string   "year"
    t.string   "area_of_interaction"
    t.string   "significant_concept"
    t.string   "unit_question"
    t.string   "subject_area_question"
    t.string   "myp_criteria"
    t.string   "type_of_task"
    t.integer  "user_id"
    t.string   "learning_readiness"
    t.string   "unit_content_concepts"
    t.string   "unit_content_skills"
    t.string   "standards"
    t.string   "intercultural_awareness"
    t.string   "learner_profile"
    t.string   "learning_support"
    t.string   "teaching_strategies"
    t.string   "approaches_skill"
    t.string   "approaches_strategy"
    t.string   "learning_activities"
    t.string   "resources"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yardsticks", :force => true do |t|
    t.integer  "standard_id"
    t.string   "label"
    t.string   "description"
    t.boolean  "middle"
    t.boolean  "high"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
