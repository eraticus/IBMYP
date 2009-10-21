class LearnerProfilesController < ApplicationController
  
  layout "admin"
  
  # GET /learner_profiles
  # GET /learner_profiles.xml
  def index
    @learner_profiles = LearnerProfile.all(:order=>:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @learner_profiles }
    end
  end

  # GET /learner_profiles/1
  # GET /learner_profiles/1.xml
  def show
    @learner_profile = LearnerProfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @learner_profile }
    end
  end

  # GET /learner_profiles/new
  # GET /learner_profiles/new.xml
  def new
    @learner_profile = LearnerProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @learner_profile }
    end
  end

  # GET /learner_profiles/1/edit
  def edit
    @learner_profile = LearnerProfile.find(params[:id])
  end

  # POST /learner_profiles
  # POST /learner_profiles.xml
  def create
    @learner_profile = LearnerProfile.new(params[:learner_profile])

    respond_to do |format|
      if @learner_profile.save
        flash[:notice] = 'LearnerProfile was successfully created.'
        format.html { redirect_to(learner_profiles_path, :anchor=>dom_id(@learner_profile)) }
        format.xml  { render :xml => @learner_profile, :status => :created, :location => @learner_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @learner_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /learner_profiles/1
  # PUT /learner_profiles/1.xml
  def update
    @learner_profile = LearnerProfile.find(params[:id])

    respond_to do |format|
      if @learner_profile.update_attributes(params[:learner_profile])
        flash[:notice] = 'LearnerProfile was successfully updated.'
        format.html { redirect_to(learner_profiles_path, :anchor=>dom_id(@learner_profile)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @learner_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /learner_profiles/1
  # DELETE /learner_profiles/1.xml
  def destroy
    @learner_profile = LearnerProfile.find(params[:id])
    @learner_profile.destroy
    flash[:notice] = "Learner Profile \'#{@learner_profile.name}\' was successfully deleted."

    respond_to do |format|
      format.html { redirect_to(learner_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
