class Question < ActiveRecord::Base
  serialize :content
  def next
    Question.all.where("order > ?", order).order("order ASC").first
  end

  def prev
    Question.all.where("order < ?", order).order("order DESC").first
  end
end