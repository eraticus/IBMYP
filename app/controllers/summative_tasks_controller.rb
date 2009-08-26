class SummativeTasksController < ApplicationController
  # GET /summative_tasks
  # GET /summative_tasks.xml
  # probably not used. Remove from routing
  def index
    @unit_planner = UnitPlanner.find params[:unit_planner_id] if params[:unit_planner_id]

    if @unit_planner
      @summative_tasks = @unit_planner.summative_tasks
    else
      @summative_tasks = SummativeTask.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @summative_tasks }
    end
  end

  # GET /summative_tasks/1
  # GET /summative_tasks/1.xml
  def show
    @summative_task = SummativeTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @summative_task }
    end
  end

  # GET /summative_tasks/new
  # GET /summative_tasks/new.xml
  def new
    @unit_planner = UnitPlanner.find params[:unit_planner_id]
    @summative_task = @unit_planner.summative_tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @summative_task }
    end
  end

  # GET /summative_tasks/1/edit
  def edit
    @summative_task = SummativeTask.find(params[:id])
    @unit_planner = @summative_task.unit_planner
  end

  # POST /summative_tasks
  # POST /summative_tasks.xml
  def create
    @unit_planner = UnitPlanner.find params[:unit_planner_id]
    @summative_task = @unit_planner.summative_tasks.new(params[:summative_task])
    #@summative_task = SummativeTask.new(params[:summative_task])

    respond_to do |format|
      if @summative_task.save
        flash[:notice] = 'SummativeTask was successfully created.'
        format.html do
          redirect_to(unit_planner_path(@summative_task.unit_planner, :anchor=>'summative_tasks')) and return if @summative_task.unit_planner
          redirect_to(@summative_task)
          end
        format.xml  { render :xml => @summative_task, :status => :created, :location => @summative_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @summative_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /summative_tasks/1
  # PUT /summative_tasks/1.xml
  def update
    @summative_task = SummativeTask.find(params[:id])

    respond_to do |format|
      if @summative_task.update_attributes(params[:summative_task])
        flash[:notice] = 'SummativeTask was successfully updated.'
        format.html do
           redirect_to(unit_planner_path(@summative_task.unit_planner, :anchor=>'summative_tasks')) and return if @summative_task.unit_planner
           redirect_to(@summative_task)
         end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @summative_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /summative_tasks/1
  # DELETE /summative_tasks/1.xml
  def destroy
    @summative_task = SummativeTask.find(params[:id])
    @summative_task.destroy

    respond_to do |format|
      format.html do
         redirect_to(@summative_task.unit_planner) and return if @summative_task.unit_planner
         redirect_to(summative_tasks)
         end
         
      format.xml  { head :ok }
    end
  end
end
