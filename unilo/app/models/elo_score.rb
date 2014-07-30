class EloScore < ActiveRecord::Base
  belongs_to :university
  belongs_to :user
  @@k = 30

  def new_rating(win, opponent)
    self.score += @@k*((win ? 1 : 0) - expected_score(opponent))
    self.save
  end

  def expected_score(opponent)
    1/(1 + 10**((opponent.score - self.score)/400))
  end
end