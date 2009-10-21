class LprofilesController < ApplicationController
  # GET /lprofiles
  # GET /lprofiles.xml
  def index
    @lprofiles = Lprofile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lprofiles }
    end
  end

  # GET /lprofiles/1
  # GET /lprofiles/1.xml
  def show
    @lprofile = Lprofile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lprofile }
    end
  end

  # GET /lprofiles/new
  # GET /lprofiles/new.xml
  def new
    @lprofile = Lprofile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lprofile }
    end
  end

  # GET /lprofiles/1/edit
  def edit
    @unit_planner = UnitPlanner.find(params[:id])
  end

  # POST /lprofiles
  # POST /lprofiles.xml
  def create
    @lprofile = Lprofile.new(params[:lprofile])

    respond_to do |format|
      if @lprofile.save
        flash[:notice] = 'Lprofile was successfully created.'
        format.html { redirect_to(@lprofile) }
        format.xml  { render :xml => @lprofile, :status => :created, :location => @lprofile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lprofile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lprofiles/1
  # PUT /lprofiles/1.xml
  def update
    @unit_planner = UnitPlanner.find(params[:id])

    respond_to do |format|
      if @lprofile.update_attributes(params[:lprofile])
        flash[:notice] = 'Lprofile was successfully updated.'
        format.html { redirect_to(@unit_planner) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lprofile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lprofiles/1
  # DELETE /lprofiles/1.xml
  def destroy
    @lprofile = Lprofile.find(params[:id])
    @lprofile.destroy

    respond_to do |format|
      format.html { redirect_to(lprofiles_url) }
      format.xml  { head :ok }
    end
  end
end
