class Question < ActiveRecord::Base
  serialize :content
  validates_uniqueness_of :order
  
  def next
    Question.all.where("order > ?", order).order("order ASC").first
  end

  def prev
    Question.all.where("order < ?", order).order("order DESC").first
  end
end