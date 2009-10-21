# Used to control and display the indicators associated with a Unit Planner.
# An indication is a join between an indicator, and a unit_planner
# params[:id] will always be the UnitPlanner.id, not the Indication.id

class IndicationsController < ApplicationController
  
  layout 'admin'
  # GET /indications
  # GET /indications.xml
  def index
    @indications = Indication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @indications }
    end
  end

  # GET /indications/1
  # GET /indications/1.xml
  def show
    @indication = Indication.find(params[:id])
    @standard = @indication.standard

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @indication }
    end
  end

  # GET /indications/new
  # GET /indications/new.xml
  def new
    # I don't know if this is technically necessary, but is logically
    # what we are doing here. Simplify later if possible
    @standard = Standard.find(params[:standard_id])
    @indication = @standard.indications.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @indication }
    end
  end

  # GET /indications/1/edit
  def edit
    @unit_planner = UnitPlanner.find(params[:id])
    #@indication = Indication.find(params[:id])
  end

  # POST /indications
  # POST /indications.xml
  def create
    @standard = Standard.find(params[:standard_id])
    @indication = @standard.indications.new(params[:indication])

    respond_to do |format|
      if @indication.save
        flash[:notice] = 'indication was successfully created.'
        format.html { redirect_to(@standard, :anchor=>'indications') }
        format.xml  { render :xml => @indication, :status => :created, :location => @indication }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @indication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /indications/1
  # PUT /indications/1.xml
  def update
    @indication = Indication.find(params[:id])

    respond_to do |format|
      if @indication.update_attributes(params[:indication])
        flash[:notice] = 'indication was successfully updated.'
        format.html { redirect_to(standard_path(@indication.standard, :anchor=>dom_id(@indication))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @indication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /indications/1
  # DELETE /indications/1.xml
  def destroy
    @indication = Indication.find(params[:id])
    @indication.destroy

    respond_to do |format|
      format.html { redirect_to(@indication.standard) }
      format.xml  { head :ok }
    end
  end
end
