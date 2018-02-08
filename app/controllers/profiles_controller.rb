require 'open-uri'
require 'json'

class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @skills = @user.skills.order(created_at: :desc)
    @review = Review.new
    @message = Message.new
    if @user.role == 'teacher'
      @lessons = @skills.flat_map { |skill| skill.lessons }
    else
      @lessons = @user.lessons.order(created_at: :desc)
    end
    skills = []
    lessons = @user.lessons.order(created_at: :desc)
    lessons.each { |lesson| skills << lesson.skill }
    @unique_skills = skills.uniq
    @total_price = 0
    @lessons.each do |lesson|
      if lesson.status == "completed"
        @total_price += lesson.price
      end
    end
    @responses = []
    @lessons.each do |lesson|
      @lesson = lesson
      if !@lesson.nil?
        @response = open(
        "https://api.meetup.com/find/groups?&sign=true&photo-host=public&lon=#{@lesson.skill.longitude}&text=#{@lesson.skill.category}&radius=5&lat=#{@lesson.skill.latitude}&page=15&key=#{ENV['MEETUP_KEY']}")
        @json = JSON.parse(@response.read)
        puts @json[0]['score'] unless @json[0].nil?
        @responses << @json
        p @responses.size
      end
    end
  end
end
