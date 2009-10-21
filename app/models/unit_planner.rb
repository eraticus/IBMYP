class UnitPlanner < ActiveRecord::Base
  belongs_to :user # author of document
  belongs_to :subject
  belongs_to :course

  has_many :summative_tasks, :dependent=>:destroy
  has_many :formative_tasks, :dependent=>:destroy
  has_many :learning_styles, :dependent=>:destroy
  
  has_many :learner_profiles, :dependent=>:destroy
  # so does not need learner_profile_attributes=(attributes)
  accepts_nested_attributes_for :learner_profiles, :allow_destroy=>true
  
  has_many :learning_styles, :dependent=>:destroy
  accepts_nested_attributes_for :learning_styles, :allow_destroy=>true
  
  validates_presence_of :teachers, :message => "please include at least one teacher"
  
  has_many :indications
  has_many :indicators, :through=>:indications
  
  has_many :lprofiles
  has_many :learner_profiles, :through=>:lprofiles

  has_and_belongs_to_many :objectives, :include=>:criterion , :order => 'objectives.subcategory' #'criterions.category, objectives.subcategory'
  has_and_belongs_to_many :standards, :order=>'label'

  # begin lifecycle methods
  after_create :add_learner_profiles # not after save!
  after_create :add_learning_styles # not after save!
  
  after_save {|y| y.objectives.clear if y.subject_id_changed?}
  after_save {|y| y.indications.clear if y.subject_id_changed?}
  after_save {|y| y.summative_tasks.each{|x| x.trim_criterions}}
  after_save {|y| y.formative_tasks.each{|x| x.trim_objectives}}

  # end lifecycle methods
  
  #TODO should this be a has_many_through relationship?
  def add_learner_profiles
    for x in %w[Balanced Caring Communicators Inquirers Knowledgable Open-Minded Principled Reflective Risk-taker Thinkers]
      # add only if it doesn't already exist. Of course, this should only be called
      # on create, so this shouldn't be an issue.
      self.learner_profiles.create(:name=>x)
    end
    nil
  end
  
  def add_learning_styles
    #TODO: fix
  end

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
