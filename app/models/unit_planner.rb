class UnitPlanner < ActiveRecord::Base
  
  attr_accessor :learner_profile_descriptions
  attr_accessor :learning_style_descriptions
  
  belongs_to :user # author of document
  belongs_to :subject
  belongs_to :course

  has_many :summative_tasks, :dependent=>:destroy
  has_many :formative_tasks, :dependent=>:destroy
  has_many :learning_styles, :dependent=>:destroy
  
  has_many :learning_styles, :dependent=>:destroy
  accepts_nested_attributes_for :learning_styles, :allow_destroy=>true
  
  validates_presence_of :teachers, :message => "please include at least one teacher"
  
  has_many :indications
  has_many :indicators, :through=>:indications
  
  #TODO: change these names! Look at
  # models
  has_many :learner_profiles
  has_many :traits, :through=>:learner_profiles
  
  has_many :learning_styles
  has_many :intelligences, :through=>:learning_styles
  
  has_many :approaches
  has_many :strategies, :through=>:approaches

  has_and_belongs_to_many :objectives, :include=>:criterion , :order => 'objectives.subcategory' #'criterions.category, objectives.subcategory'
  
  has_many :coverages
  has_many :standards, :through=>:coverages, :order=>'label'

  # begin lifecycle methods
  
  before_save :set_learner_profile_descriptions
  before_save :set_learning_style_descriptions
  
  after_save {|y| y.objectives.clear if y.subject_id_changed?}
  after_save {|y| y.indications.clear if y.subject_id_changed?}
  after_save {|y| y.summative_tasks.each{|x| x.trim_criterions}}
  after_save {|y| y.formative_tasks.each{|x| x.trim_objectives}}

  # end lifecycle methods
  
  def set_learner_profile_descriptions  
    
    return unless learner_profile_descriptions
    
    # delete any current learner_profile.description values
    learner_profiles.each do |lp|
      lp.update_attribute(:description, nil)
    end
          
    for x in learner_profile_descriptions.keys
      if trait_ids.include? x.to_i
        # find the learner_profile corresponding to the trait
        # and update the description from the virtual attribute
        learner_profile = LearnerProfile.find_by_trait_id(x.to_i)
        learner_profile.update_attribute(:description, learner_profile_descriptions[x])
      end
    end
  end
  
  def set_learning_style_descriptions  
    return unless learning_style_descriptions
    
    learning_styles.each do |style|
      style.update_attribute(:description, nil)
    end
          
    for x in learning_style_descriptions.keys
      if intelligence_ids.include? x.to_i
        learning_style = learning_styles.find_by_intelligence_id(x.to_i)
        learning_style.update_attribute(:description, learning_style_descriptions[x])
      end
    end  end
  

  # poor substitute for has and belongs to many criterions
  def criterions
    objectives.collect(&:criterion).uniq.sort{|a,b| a.category <=> b.category}
  end

  # this is only valid if not language_b
  def myp_criteria
    #self.objectives.collect(&:criterion).uniq.collect(&:category).join(", ")
    criterions.collect(&:category).join(", ")
  end

  # def clear_objectives
  #   objectives.clear if subject_area_changed?
  # end


  # if objectives are clear, then remove the summative_task_criterions
  def clear_summative_task_criterions
    if (objectives.empty?) # if objectives are clear, then clear out summative_task_criterions
      summative_tasks.each do |x|
        x.criterions.clear
      end
    else # delete criterions from summative_tasks that are not not contained by objectives
      summative_tasks.each do |task|
        task.criterions.each do |criterion|
          task.criterions.delete(criterion) unless objectives.collect(&:criterion).include?(criterion)
        end
      end
    end
  end

end
