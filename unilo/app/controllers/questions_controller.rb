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

end
