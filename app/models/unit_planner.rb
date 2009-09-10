class UnitPlanner < ActiveRecord::Base
  belongs_to :user # author of document
  belongs_to :subject
  
  belongs_to :course

  has_many :summative_tasks, :dependent=>:destroy
  has_many :formative_tasks, :dependent=>:destroy
  has_many :learning_styles, :dependent=>:destroy
  
  validates_presence_of :teachers, :message => "please include at least one teacher"

  has_and_belongs_to_many :objectives, :include=>:criterion , :order => 'objectives.subcategory' #'criterions.category, objectives.subcategory'
  has_and_belongs_to_many :standards, :order=>'label'

  #begin lifecycle methods
  after_save {|y| y.objectives.clear if y.subject_id_changed?}
  after_save {|y| y.summative_tasks.each{|x| x.trim_criterions}}
  after_save { |y|  y.formative_tasks.each{|x| x.trim_objectives }}

  # end lifecycle methods

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
