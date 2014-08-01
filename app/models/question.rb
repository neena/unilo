class Question < ActiveRecord::Base
  serialize :content
  validates_uniqueness_of :order
  before_validation :auto_order
  
  def next
    Question.select do |q|
      q.order > self.order
    end.sort_by(&:order).first
  end

  def prev
    Question.select do |q|
      q.order < self.order
    end.sort_by(&:order).reverse.first
  end

  private
  def auto_order
    unless Question.find_by_order(1)
      self.order = 1
    end
    unless self.order
      self.order = Question.last.order + 1
    end
  end
end