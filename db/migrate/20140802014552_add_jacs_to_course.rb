class AddJacsToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :jacs_code, index: :true
  end
end
