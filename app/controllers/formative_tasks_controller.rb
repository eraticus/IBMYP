class FormativeTasksController < ApplicationController
  # GET /formative_tasks
  # GET /formative_tasks.xml
  
  def index
    @unit_planner = UnitPlanner.find params[:unit_planner_id] if params[:unit_planner_id]

    if @unit_planner
      @formative_tasks = @unit_planner.formative_tasks
    else
      @formative_tasks = FormativeTask.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @formative_tasks }
    end
  end

  # GET /formative_tasks/1
  # GET /formative_tasks/1.xml
  def show
    @formative_task = FormativeTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @formative_task }
    end
  end

  # GET /formative_tasks/new
  # GET /formative_tasks/new.xml
  def new
    @unit_planner = UnitPlanner.find params[:unit_planner_id]
    @formative_task = @unit_planner.formative_tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @formative_task }
    end
  end

  # GET /formative_tasks/1/edit
  def edit
    # not strictly necessary. But probably good idiot check...
    @unit_planner = UnitPlanner.find(params[:unit_planner_id])
    @formative_task = @unit_planner.formative_tasks.find(params[:id])
  end

  # POST /formative_tasks
  # POST /formative_tasks.xml
  def create
    @unit_planner = UnitPlanner.find params[:unit_planner_id]
    @formative_task = @unit_planner.formative_tasks.new(params[:formative_task])

    respond_to do |format|
      if @formative_task.save
        flash[:notice] = 'FormativeTask was successfully created.'
        format.html { redirect_to(unit_planner_path(@unit_planner, :anchor=>'formative_tasks')) }
        format.xml  { render :xml => @formative_task, :status => :created, :location => @formative_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @formative_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /formative_tasks/1
  # PUT /formative_tasks/1.xml
  def update
    @unit_planner = UnitPlanner.find(params[:unit_planner_id])
    @formative_task = @unit_planner.formative_tasks.find(params[:id])

    respond_to do |format|
      if @formative_task.update_attributes(params[:formative_task])
        flash[:notice] = 'FormativeTask was successfully updated.'
        format.html { redirect_to(unit_planner_path(@unit_planner, :anchor=>'formative_tasks')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @formative_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /formative_tasks/1
  # DELETE /formative_tasks/1.xml
  def destroy
    @formative_task = FormativeTask.find(params[:id])
    @formative_task.destroy

    respond_to do |format|
      format.html { redirect_to(unit_planner_path(@formative_task.unit_planner, :anchor=>'formative_tasks')) }
      format.xml  { head :ok }
    end
  end
end
