class CoveragesController < ApplicationController
  # GET /coverages
  # GET /coverages.xml
  def index
    @coverages = Coverage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coverages }
    end
  end

  # GET /coverages/1
  # GET /coverages/1.xml
  def show
    @coverage = Coverage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coverage }
    end
  end

  # GET /coverages/new
  # GET /coverages/new.xml
  def new
    @coverage = Coverage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coverage }
    end
  end

  # GET /coverages/1/edit
  def edit
    @coverage = Coverage.find(params[:id])
  end

  # POST /coverages
  # POST /coverages.xml
  def create
    @coverage = Coverage.new(params[:coverage])

    respond_to do |format|
      if @coverage.save
        flash[:notice] = 'Coverage was successfully created.'
        format.html { redirect_to(@coverage) }
        format.xml  { render :xml => @coverage, :status => :created, :location => @coverage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coverage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coverages/1
  # PUT /coverages/1.xml
  def update
    @coverage = Coverage.find(params[:id])

    respond_to do |format|
      if @coverage.update_attributes(params[:coverage])
        flash[:notice] = 'Coverage was successfully updated.'
        format.html { redirect_to(@coverage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coverage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coverages/1
  # DELETE /coverages/1.xml
  def destroy
    @coverage = Coverage.find(params[:id])
    @coverage.destroy

    respond_to do |format|
      format.html { redirect_to(coverages_url) }
      format.xml  { head :ok }
    end
  end
end
