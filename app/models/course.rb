class Course < ActiveRecord::Base
  belongs_to :university
  belongs_to :jacs_code

  def get_attribute(name)
    begin
      eval(name)
    rescue 
      nil
    end
  end
end
