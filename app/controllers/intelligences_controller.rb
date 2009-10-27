class IntelligencesController < ApplicationController
  # GET /intelligences
  # GET /intelligences.xml
  def index
    @intelligences = Intelligence.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @intelligences }
    end
  end

  # GET /intelligences/1
  # GET /intelligences/1.xml
  def show
    @intelligence = Intelligence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @intelligence }
    end
  end

  # GET /intelligences/new
  # GET /intelligences/new.xml
  def new
    @intelligence = Intelligence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @intelligence }
    end
  end

  # GET /intelligences/1/edit
  def edit
    @intelligence = Intelligence.find(params[:id])
  end

  # POST /intelligences
  # POST /intelligences.xml
  def create
    @intelligence = Intelligence.new(params[:intelligence])

    respond_to do |format|
      if @intelligence.save
        flash[:notice] = 'Intelligence was successfully created.'
        format.html { redirect_to intelligences_path }
        format.xml  { render :xml => @intelligence, :status => :created, :location => @intelligence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @intelligence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /intelligences/1
  # PUT /intelligences/1.xml
  def update
    @intelligence = Intelligence.find(params[:id])

    respond_to do |format|
      if @intelligence.update_attributes(params[:intelligence])
        flash[:notice] = 'Intelligence was successfully updated.'
        format.html { redirect_to(intelligences_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @intelligence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /intelligences/1
  # DELETE /intelligences/1.xml
  def destroy
    @intelligence = Intelligence.find(params[:id])
    @intelligence.destroy

    respond_to do |format|
      format.html { redirect_to(intelligences_url) }
      format.xml  { head :ok }
    end
  end
end
