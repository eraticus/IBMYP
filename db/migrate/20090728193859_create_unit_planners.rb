class CreateUnitPlanners < ActiveRecord::Migration
  def self.up
    create_table :unit_planners do |t|
      t.integer "subject_id"
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
      # t.string   "myp_objective"
      # t.string   "chosen_myp_criteria"
      t.string   "myp_criteria" # to be used only by language B
      # t.integer   "summative_blooms_level"
      # t.integer   "formative_blooms_level"
      t.string   "type_of_task"
      # t.string   "summative_assessment"
      # t.integer  "quarter"
      t.integer  "user_id"
      
      # backwater planning
      t.string  :learning_readiness
      t.string  :unit_content_concepts
      t.string  :unit_content_skills
      t.string  :standards
      t.string  :intercultural_awareness
      t.string  :learner_profile
      t.string  :learning_support
      t.string  :teaching_strategies
      t.string  :approaches_skill
      t.string  :approaches_strategy
      t.string  :learning_activities
      t.string  :resources
      
      t.timestamps
    end
  end

  def self.down
    drop_table :unit_planners
  end
end
