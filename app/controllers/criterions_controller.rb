class CriterionsController < ApplicationController
  # GET /criterions
  # GET /criterions.xml
  def index
    @criterions = Criterion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @criterions }
    end
  end

  # GET /criterions/1
  # GET /criterions/1.xml
  def show
    @criterion = Criterion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @criterion }
    end
  end

  # GET /criterions/new
  # GET /criterions/new.xml
  def new
    @criterion = Criterion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @criterion }
    end
  end

  # GET /criterions/1/edit
  def edit
    @criterion = Criterion.find(params[:id])
  end

  # POST /criterions
  # POST /criterions.xml
  def create
    @criterion = Criterion.new(params[:criterion])

    respond_to do |format|
      if @criterion.save
        flash[:notice] = 'Criterion was successfully created.'
        format.html { redirect_to(@criterion) }
        format.xml  { render :xml => @criterion, :status => :created, :location => @criterion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @criterion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /criterions/1
  # PUT /criterions/1.xml
  def update
    @criterion = Criterion.find(params[:id])

    respond_to do |format|
      if @criterion.update_attributes(params[:criterion])
        flash[:notice] = 'Criterion was successfully updated.'
        format.html { redirect_to(@criterion) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @criterion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /criterions/1
  # DELETE /criterions/1.xml
  def destroy
    @criterion = Criterion.find(params[:id])
    @criterion.destroy

    respond_to do |format|
      format.html { redirect_to(criterions_url) }
      format.xml  { head :ok }
    end
  end
end
