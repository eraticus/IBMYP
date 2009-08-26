class StandardGroupsController < ApplicationController
  # GET /standard_groups
  # GET /standard_groups.xml
  def index
    @standard_groups = StandardGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @standard_groups }
    end
  end

  # GET /standard_groups/1
  # GET /standard_groups/1.xml
  def show
    @standard_group = StandardGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @standard_group }
    end
  end

  # GET /standard_groups/new
  # GET /standard_groups/new.xml
  def new
    @standard_group = StandardGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @standard_group }
    end
  end

  # GET /standard_groups/1/edit
  def edit
    @standard_group = StandardGroup.find(params[:id])
  end

  # POST /standard_groups
  # POST /standard_groups.xml
  def create
    @standard_group = StandardGroup.new(params[:standard_group])

    respond_to do |format|
      if @standard_group.save
        flash[:notice] = 'StandardGroup was successfully created.'
        format.html { redirect_to(@standard_group) }
        format.xml  { render :xml => @standard_group, :status => :created, :location => @standard_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @standard_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /standard_groups/1
  # PUT /standard_groups/1.xml
  def update
    @standard_group = StandardGroup.find(params[:id])

    respond_to do |format|
      if @standard_group.update_attributes(params[:standard_group])
        flash[:notice] = 'StandardGroup was successfully updated.'
        format.html { redirect_to(@standard_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @standard_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /standard_groups/1
  # DELETE /standard_groups/1.xml
  def destroy
    @standard_group = StandardGroup.find(params[:id])
    @standard_group.destroy

    respond_to do |format|
      format.html { redirect_to(standard_groups_url) }
      format.xml  { head :ok }
    end
  end
end
