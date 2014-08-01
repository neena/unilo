class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to Question.first
  end

  def show
    @question = Question.find(params[:id])
    @jacs = JacsCode.all.map(&:name) if @question.question_type == "jacs"
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
    end.first(20).each do |(c, s)|
      e = EloScore.new(university: c.university, user: current_user, score: (100 + s))
      e.save
    end
    redirect_to elos_path
  end 
end
