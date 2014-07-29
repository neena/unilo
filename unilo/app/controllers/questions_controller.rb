class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def next_question
    session[:user_response] = {} unless session[:user_response]
    
    @question = Question.find(params[:id])
    session[:user_response][@question.identifier.to_sym] = params[:response]
    
    redirect_to @question.next_question
  end

  def complete
    Course.all.select do |course|
      course.jacs == session[:user_response][:jacs_course_id]
    end.inject({}) do |courses, c|
      courses[c] = session[:user_response].inject(0) do |score, (k, v)|
        eval("c.#{k}")*v if v.is_a? Numeric
      end
      courses
    end.sort_by do |course, score|
      score
    end.map.values
  end 
end
