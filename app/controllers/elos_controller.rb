class ElosController < ApplicationController
  before_action :authenticate_user!
  def index
    @unis = current_user.universities
    @uni1 = @unis.sample
    @uni2 = @unis.sample
    while @uni2 == @uni1
      @uni2 = @unis.sample
    end
    redirect_to elo_path({id1: @uni1.id, id2: @uni2.id})
  end

  def show
    @university1 = University.find(params[:id1])
    @university2 = University.find(params[:id2])
  end

  def complete
    high_score = current_user.elo_scores.find_by_university_id(params[:preferred_university_id])
    low_score = current_user.elo_scores.find_by_university_id(params[:other_university_id])

    high_score.new_rating(true, low_score)
    low_score.new_rating(false, high_score)
    high_score.save
    low_score.save

    redirect_to elos_path
  end 

  def end
    @universities = current_user.elo_scores.sort_by do |elo|
      elo.score
    end.map(&:university).last(3)
  end
end