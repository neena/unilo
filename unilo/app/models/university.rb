class University < ActiveRecord::Base
  has_many :courses
  def inspect
    puts "Location: #{location}"
  end
end
