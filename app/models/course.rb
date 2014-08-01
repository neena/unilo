class Course < ActiveRecord::Base
  belongs_to :university

  def get_attribute(name)
    begin
      eval(name)
    rescue 
      nil
    end
  end
end
