class ObjectivesController < ApplicationController
  
  layout 'admin'
  
  # GET /objectives
  # GET /objectives.xml
  def index
    @objectives = Objective.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @objectives }
    end
  end

  # GET /objectives/1
  # GET /objectives/1.xml
  def show
    @objective = Objective.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @objective }
    end
  end

  # GET /objectives/new
  # GET /objectives/new.xml
  def new
    @criterion = Criterion.find params[:criterion_id]
    @objective = @criterion.objectives.new
    @objective.subcategory = @criterion.objectives.collect(&:subcategory).last.next unless @criterion.objectives.empty?
    @objective.subcategory ||= '1'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @objective }
    end
  end

  # GET /objectives/1/edit
  def edit
    @objective = Objective.find(params[:id])
  end

  # POST /objectives
  # POST /objectives.xml
  def create
    @criterion = Criterion.find(params[:criterion_id])
    @objective = @criterion.objectives.new(params[:objective])

    respond_to do |format|
      if @objective.save
        flash[:notice] = 'Objective was successfully created.'
        format.html { redirect_to(@criterion) }
        format.xml  { render :xml => @objective, :status => :created, :location => @objective }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @objective.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /objectives/1
  # PUT /objectives/1.xml
  def update
    @objective = Objective.find(params[:id])

    respond_to do |format|
      if @objective.update_attributes(params[:objective])
        flash[:notice] = 'Objective was successfully updated.'
        format.html { redirect_to(@objective) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @objective.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.xml
  def destroy
    @objective = Objective.find(params[:id])
    @objective.destroy

    respond_to do |format|
      format.html { redirect_to(criterion_url(@objective.criterion)) }
      format.xml  { head :ok }
    end
  end
end
