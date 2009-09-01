class YardsticksController < ApplicationController
  # GET /yardsticks
  # GET /yardsticks.xml
  def index
    @yardsticks = Yardstick.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @yardsticks }
    end
  end

  # GET /yardsticks/1
  # GET /yardsticks/1.xml
  def show
    @yardstick = Yardstick.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @yardstick }
    end
  end

  # GET /yardsticks/new
  # GET /yardsticks/new.xml
  def new
    @yardstick = Yardstick.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @yardstick }
    end
  end

  # GET /yardsticks/1/edit
  def edit
    @yardstick = Yardstick.find(params[:id])
  end

  # POST /yardsticks
  # POST /yardsticks.xml
  def create
    @yardstick = Yardstick.new(params[:yardstick])

    respond_to do |format|
      if @yardstick.save
        flash[:notice] = 'Yardstick was successfully created.'
        format.html { redirect_to(@yardstick) }
        format.xml  { render :xml => @yardstick, :status => :created, :location => @yardstick }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @yardstick.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /yardsticks/1
  # PUT /yardsticks/1.xml
  def update
    @yardstick = Yardstick.find(params[:id])

    respond_to do |format|
      if @yardstick.update_attributes(params[:yardstick])
        flash[:notice] = 'Yardstick was successfully updated.'
        format.html { redirect_to(@yardstick) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @yardstick.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /yardsticks/1
  # DELETE /yardsticks/1.xml
  def destroy
    @yardstick = Yardstick.find(params[:id])
    @yardstick.destroy

    respond_to do |format|
      format.html { redirect_to(yardsticks_url) }
      format.xml  { head :ok }
    end
  end
end
