class StandardsController < ApplicationController
  # GET /standards
  # GET /standards.xml
  def index
    @standards = Standard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @standards }
    end
  end

  # GET /standards/1
  # GET /standards/1.xml
  def show
    @standard = Standard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @standard }
    end
  end

  # GET /standards/new
  # GET /standards/new.xml
  def new
    @standard = Standard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @standard }
    end
  end

  # GET /standards/1/edit
  def edit
    @standard = Standard.find(params[:id])
  end

  # POST /standards
  # POST /standards.xml
  def create
    @standard = Standard.new(params[:standard])

    respond_to do |format|
      if @standard.save
        flash[:notice] = 'Standard was successfully created.'
        format.html { redirect_to(@standard) }
        format.xml  { render :xml => @standard, :status => :created, :location => @standard }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @standard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /standards/1
  # PUT /standards/1.xml
  def update
    @standard = Standard.find(params[:id])

    respond_to do |format|
      if @standard.update_attributes(params[:standard])
        flash[:notice] = 'Standard was successfully updated.'
        format.html { redirect_to(@standard) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @standard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /standards/1
  # DELETE /standards/1.xml
  def destroy
    @standard = Standard.find(params[:id])
    @standard.destroy

    respond_to do |format|
      format.html { redirect_to(standards_url) }
      format.xml  { head :ok }
    end
  end
end
