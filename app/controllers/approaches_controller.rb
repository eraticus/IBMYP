class ApproachesController < ApplicationController
  # GET /approaches
  # GET /approaches.xml
  def index
    @approaches = Approach.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @approaches }
    end
  end

  # GET /approaches/1
  # GET /approaches/1.xml
  def show
    @approach = Approach.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @approach }
    end
  end

  # GET /approaches/new
  # GET /approaches/new.xml
  def new
    @approach = Approach.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @approach }
    end
  end

  # GET /approaches/1/edit
  def edit
    @unit_planner = UnitPlanner.find(params[:unit_planner_id])
    @skills = Skill.all(:order=>:label)
  end

  # POST /approaches
  # POST /approaches.xml
  def create
    @approach = Approach.new(params[:approach])

    respond_to do |format|
      if @approach.save
        flash[:notice] = 'Approach was successfully created.'
        format.html { redirect_to(@approach) }
        format.xml  { render :xml => @approach, :status => :created, :location => @approach }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @approach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /approaches/1
  # PUT /approaches/1.xml
  def update
    @approach = Approach.find(params[:id])

    respond_to do |format|
      if @approach.update_attributes(params[:approach])
        flash[:notice] = 'Approach was successfully updated.'
        format.html { redirect_to(@approach) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @approach.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /approaches/1
  # DELETE /approaches/1.xml
  def destroy
    @approach = Approach.find(params[:id])
    @approach.destroy

    respond_to do |format|
      format.html { redirect_to(approaches_url) }
      format.xml  { head :ok }
    end
  end
end
