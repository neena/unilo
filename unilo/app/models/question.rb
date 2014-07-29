class Question < ActiveRecord::Base
  serialize :content
  def next
    Photos.all.where("order > ?", order).order("order ASC").first
  end

  def prev
    Photos.all.where("order < ?", order).order("order DESC").first
  end
end