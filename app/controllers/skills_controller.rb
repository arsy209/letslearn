class SkillsController < ApplicationController
  before_action :set_skill, only: [ :show, :edit, :update, :destroy]

  def index
    @skills = Skill.search(params)
    @mapped_skills = @skills.where.not(skills: {latitude: nil, longitude: nil})
    @markers = Gmaps4rails.build_markers(@mapped_skills) do |skill, marker|
      marker.lat skill.latitude
      marker.lng skill.longitude
      marker.infowindow render_to_string(partial: "/skills/skill_preview", locals: { skill: skill })
    end
  end

  def show
    @message = Message.new
    @reviews =  @skill.reviews
    @review = Review.new
  end

  def new
    @skill = Skill.new
  end

  def edit
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.teacher = current_user
    respond_to do |format|
      if @skill.save
        format.html { redirect_to profile_path(current_user), notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end


  def skill_params
    params.require(:skill).permit(:name, :price, :description, :teacher_id, :location, :availability, :category, :skill_rating)
  end
end
