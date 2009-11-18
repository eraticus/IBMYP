class SkillsController < ApplicationController
  
  layout 'admin'
  
  # GET /skills
  # GET /skills.xml
  def index
    @skills = Skill.all(:order=>:label)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @skills }
    end
  end

  # GET /skills/1
  # GET /skills/1.xml
  # def show
  #   @skill = Skill.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @skill }
  #   end
  # end

  # GET /skills/new
  # GET /skills/new.xml
  def new
    @skill = Skill.new
    @skill.label = Skill.all.collect(&:label).sort.last.next unless Skill.all.empty?
    @skill.label ||= 'A'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @skill }
    end
  end

  # GET /skills/1/edit
  def edit
    @skill = Skill.find(params[:id])
  end

  # POST /skills
  # POST /skills.xml
  def create
    @skill = Skill.new(params[:skill])

    respond_to do |format|
      if @skill.save
        flash[:notice] = 'Skill was successfully created.'
        format.html { redirect_to(skills_url(:anchor=>dom_id(@skill))) }
        format.xml  { render :xml => @skill, :status => :created, :location => @skill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @skill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /skills/1
  # PUT /skills/1.xml
  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        flash[:notice] = 'Skill was successfully updated.'
        format.html { redirect_to(skills_url(:anchor=>dom_id(@skill))) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @skill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.xml
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to(skills_url) }
      format.xml  { head :ok }
    end
  end
end
