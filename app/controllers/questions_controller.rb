class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @question = Question.find(params[:id])
  end

  def next_question
    @question = Question.find(params[:id])
    current_user.preferences[@question.identifier.to_sym] = params[:response]
    
    redirect_to @question.next_question
  end

  def complete
    current_user.elo_scores.each{|e| e.delete}

    current_user.preferences[:jacs_course_id] = "001"
    session[:user_response] = {satisfaction: 0.1}

    enumerable_set_thing = Course.all.select do |course|
      course.jacs == current_user.preferences[:jacs_course_id]
    end.inject({}) do |courses, c|
      courses[c] = session[:user_response].inject(0) do |score, (k, v)|
        eval("c.#{k}")*v if v.is_a? Numeric
      end
      courses
    end.sort_by do |course, score|
      score
    end.map do |x|
      x[0]
    end.first(20).each do |c|
      e = EloScore.new(university: c.university, user: current_user, score: 115)
      e.save
    end
    redirect_to elo_questions_path
  end 

  def elo
    @universities = current_user.universities
    @university1 = @universities.sample
    @university2 = @universities.sample
  end

  def elo_choose
    p params

    high_score = current_user.elo_scores.find_by_university_id(params[:preferred_university_id])
    low_score = current_user.elo_scores.find_by_university_id(params[:other_university_id])
    high_score.new_rating(true, low_score)
    low_score.new_rating(false, high_score)
    high_score.save
    low_score.save
    redirect_to elo_questions_path
  end 
end
