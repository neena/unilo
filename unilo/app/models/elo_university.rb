class EloScore
  attr_accessor :score
  @@k = 30

  def initialize(university_id, rating=115)
    @rating = rating
  end

  def new_rating(win?, player_score)
    @rating += @@k*((win? ? 1 : 0) - expected_score(player_score))
  end

  def expected_score(player_score)
    1/(1+10**((player_score - @score)/400))
  end
end