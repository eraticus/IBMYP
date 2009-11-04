class UnitPlannersController < ApplicationController
  
  def update_course_selection
    
    @subject = Subject.find(params[:subject_id])
    @courses = @subject.courses
    
    render :update do |page|
      page.replace_html 'course', :partial => 'course', :locals=>{:courses=>@courses}
      #   page.replace_html  'user_list', :partial => 'user', :collection => @users
      # page.visual_effect :highlight, 'user_list'
       #page.visual_effect :highlight, 'course'
      #page.replace_html 'course', :text=>"Subject changed to #{Subject.find(params[:subject_id]).name}"
    end
    
  end

  # GET /unit_planners
  # GET /unit_planners.xml
  def index
    user = User.find(params[:user_id]) if params[:user_id]
    if user
      @unit_planners = user.unit_planners
    else
      @unit_planners = UnitPlanner.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unit_planners }
    end
  end

  # GET /unit_planners/1
  # GET /unit_planners/1.xml
  def show
    @unit_planner = UnitPlanner.find(params[:id])
    
    @skills = Skill.all(:include=>{:strategies=>:approaches}, :order=>"skills.label", :conditions=>["approaches.unit_planner_id=?", @unit_planner.id])

    # move to model? Also, this seems a bit complicated. Any way to simplify?
    x = @unit_planner.objectives
    y = @unit_planner.formative_tasks.collect{|ft| ft.objectives}.flatten.uniq
    @objectives_sans_formative_tasks = (x - y).collect{|x| "#{x.criterion.category}.#{x.subcategory}"}.sort
    @criterions_sans_summative_tasks = (@unit_planner.criterions - @unit_planner.summative_tasks.collect(&:criterions).flatten.uniq).collect(&:category).join(", ")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unit_planner }
    end
  end

  # GET /unit_planners/new
  # GET /unit_planners/new.xml
  def new
    @unit_planner = UnitPlanner.new
    @unit_planner.subject = Subject.first(:order=>:name)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unit_planner }
    end
  end

  # set the objectives after filling out the application
  def edit_objectives
    @unit_planner = UnitPlanner.find(params[:id])
  end

  def update_objectives
    @unit_planner = UnitPlanner.find(params[:id])

    # for this method, there is the possibility that params[:unit_planner] is not defined,
    # which should be interpreted as the user clearing the objectives.
      params[:unit_planner] ||= {:objective_ids=>[]}
    
    respond_to do |format|
      if @unit_planner.update_attributes(params[:unit_planner])
        flash[:notice] = 'MYP Objectives were successfully updated.'
        format.html do
            redirect_to(unit_planner_path(@unit_planner, :anchor=>'unit_objectives'))

        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_objectives" }
        format.xml  { render :xml => @unit_planner.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit_tasks
    @unit_planner = UnitPlanner.find(params[:id])
  end
    
  # edit backward planner section of unit_planner
  def edit_backward_planner
    @unit_planner = UnitPlanner.find(params[:id])
  end
  
  # edit backward planner section of unit_planner
  def update_backward_planner
    @unit_planner = UnitPlanner.find(params[:id])

    respond_to do |format|
      if @unit_planner.update_attributes(params[:unit_planner])
        flash[:notice] = 'Backward planner was successfully updated.'
        format.html do
          redirect_to(unit_planner_path(@unit_planner, :anchor=>'backward_planner'))
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_backward_planner" }
        format.xml  { render :xml => @unit_planner.errors, :status => :unprocessable_entity }
      end
    end  
  end
  
  
  
  def update_tasks

    @unit_planner = UnitPlanner.find(params[:id])
    
    # if no checkboxes are checked, need this line
    params[:unit_planner] ||= {}
    params[:unit_planner][:assessment_criterion_ids] ||= []
    params[:unit_planner][:formative_objective_ids] ||= []

    respond_to do |format|
      if @unit_planner.update_attributes(params[:unit_planner])    
        flash[:notice] = 'MYP Summative Assessment and Formative Tasks have been updated'
        format.html {
          redirect_to(@unit_planner) # show
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_tasks" }
        format.xml  { render :xml => @unit_planner.errors, :status => :unprocessable_entity }
      end

    end
  end


  # GET /unit_planners/1/edit
  def edit
    @unit_planner = UnitPlanner.find(params[:id])
  end

  # POST /unit_planners
  # POST /unit_planners.xml
  def create
    @unit_planner = current_user.unit_planners.new(params[:unit_planner])

    respond_to do |format|
      if @unit_planner.save
        flash[:notice] = 'UnitPlanner was successfully created.'
        #format.html { redirect_to(@unit_planner) }
        # this id business is sort of a substitute for a nested resource.
        # convert to nested resource?
        format.html {redirect_to(edit_objectives_unit_planner_path(:id=>@unit_planner.id))}
        format.xml  { render :xml => @unit_planner, :status => :created, :location => @unit_planner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unit_planner.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit_visioning
    @unit_planner = UnitPlanner.find(params[:id])
  end
  
  def edit_identification
    @unit_planner = UnitPlanner.find(params[:id])
  end
  
  def update_identification
    update
  end
  
  def update_learning_styles
    @unit_planner = UnitPlanner.find(params[:id])
    
    params[:unit_planner][:intelligences] ||= []

    respond_to do |format|
      if @unit_planner.update_attributes(params[:unit_planner])

        flash[:notice] = 'UnitPlanner was successfully updated.'
        format.html do
            redirect_to(unit_planner_url(@unit_planner, :anchor=>"learning_styles"))
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit_planner.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update_learner_profiles
    @unit_planner = UnitPlanner.find(params[:id])
    
    #if the learner_profiles checkbox array is empty,
    # interpret as having all values unchecked. Clear
    # learner_profiles collection in this case. 
    params[:unit_planner][:trait_ids] ||= []

    respond_to do |format|
      if @unit_planner.update_attributes(params[:unit_planner])

        flash[:notice] = 'UnitPlanner was successfully updated.'
        format.html do
          redirect_to(unit_planner_url(@unit_planner, :anchor=>'learner_profiles'))
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit_planner.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # PUT /unit_planners/1
  # PUT /unit_planners/1.xml
  def update
    @unit_planner = UnitPlanner.find(params[:id])
    
    respond_to do |format|
      if @unit_planner.update_attributes(params[:unit_planner])

        flash[:notice] = 'UnitPlanner was successfully updated.'
        format.html do
          if @unit_planner.objectives.empty?
            redirect_to(edit_objectives_unit_planner_url(@unit_planner)) #and return
          else
            redirect_to(@unit_planner)
          end
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit_planner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_planners/1
  # DELETE /unit_planners/1.xml
  def destroy
    @unit_planner = UnitPlanner.find(params[:id])
    @unit_planner.destroy

    respond_to do |format|
      format.html { redirect_to(unit_planners_url) }
      format.xml  { head :ok }
    end
  end
end
