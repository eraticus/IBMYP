class IndicatorsController < ApplicationController
  
  layout 'admin'
  # GET /indicators
  # GET /indicators.xml
  def index
    @indicators = Indicator.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @indicators }
    end
  end

  # GET /indicators/1
  # GET /indicators/1.xml
  def show
    @indicator = Indicator.find(params[:id])
    @standard = @indicator.standard

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @indicator }
    end
  end

  # GET /indicators/new
  # GET /indicators/new.xml
  def new
    # I don't know if this is technically necessary, but is logically
    # what we are doing here. Simplify later if possible
    @standard = Standard.find(params[:standard_id])
    @indicator = @standard.indicators.new
    
    # label = @subject.standards.collect(&:label).last.succ unless @subject.standards.empty?
    # label = '1' if label.blank?
    # @standard.label=label
    
    
    label = @standard.indicators.collect(&:label).last.succ unless @standard.indicators.empty?
    label = '1' if label.blank?
    @indicator.label=label

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @indicator }
    end
  end

  # GET /indicators/1/edit
  def edit
    @indicator = Indicator.find(params[:id])
  end

  # POST /indicators
  # POST /indicators.xml
  def create
    @standard = Standard.find(params[:standard_id])
    @indicator = @standard.indicators.new(params[:indicator])

    respond_to do |format|
      if @indicator.save
        flash[:notice] = 'indicator was successfully created.'
        format.html { redirect_to(@standard, :anchor=>'indicators') }
        format.xml  { render :xml => @indicator, :status => :created, :location => @indicator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @indicator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /indicators/1
  # PUT /indicators/1.xml
  def update
    @indicator = Indicator.find(params[:id])

    respond_to do |format|
      if @indicator.update_attributes(params[:indicator])
        flash[:notice] = 'indicator was successfully updated.'
        format.html { redirect_to(standard_path(@indicator.standard, :anchor=>dom_id(@indicator))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @indicator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /indicators/1
  # DELETE /indicators/1.xml
  def destroy
    @indicator = Indicator.find(params[:id])
    @indicator.destroy

    respond_to do |format|
      format.html { redirect_to(@indicator.standard) }
      format.xml  { head :ok }
    end
  end
end
