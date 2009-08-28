class LearningStylesController < ApplicationController
  # GET /learning_styles
  # GET /learning_styles.xml
  def index
    @learning_styles = LearningStyle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @learning_styles }
    end
  end

  # GET /learning_styles/1
  # GET /learning_styles/1.xml
  def show
    @learning_style = LearningStyle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @learning_style }
    end
  end

  # GET /learning_styles/new
  # GET /learning_styles/new.xml
  def new
    @unit_planner = UnitPlanner.find(params[:unit_planner_id])
    @learning_style = @unit_planner.learning_styles.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @learning_style }
    end
  end

  # GET /learning_styles/1/edit
  def edit
    @unit_planner = UnitPlanner.find(params[:unit_planner_id])
    @learning_style = @unit_planner.learning_styles.find(params[:id])
  end

  # POST /learning_styles
  # POST /learning_styles.xml
  def create
    @unit_planner = UnitPlanner.find(params[:unit_planner_id])
    @learning_style = @unit_planner.learning_styles.new(params[:learning_style])

    respond_to do |format|
      if @learning_style.save
        flash[:notice] = 'LearningStyle was successfully created.'
        format.html { redirect_to(unit_planner_path(@unit_planner, :anchor=>:learning_styles)) }
        format.xml  { render :xml => @learning_style, :status => :created, :location => @learning_style }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @learning_style.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /learning_styles/1
  # PUT /learning_styles/1.xml
  def update
    @unit_planner = UnitPlanner.find(params[:unit_planner_id])
    @learning_style = @unit_planner.learning_styles.find(params[:id])

    respond_to do |format|
      if @learning_style.update_attributes(params[:learning_style])
        flash[:notice] = 'LearningStyle was successfully updated.'
        format.html { redirect_to(unit_planner_path(@unit_planner, :anchor=>"learning_styles")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @learning_style.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_styles/1
  # DELETE /learning_styles/1.xml
  def destroy
    @learning_style = LearningStyle.find(params[:id])
    @learning_style.destroy

    respond_to do |format|
      format.html { redirect_to(unit_planner_path(@learning_style.unit_planner, :anchor=>"learning_styles")) }
      format.xml  { head :ok }
    end
  end
end
