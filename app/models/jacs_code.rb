class JacsCode < ActiveRecord::Base
  has_many :courses
  def to_h
    {code: self.code, name: self.name}
  end
end
