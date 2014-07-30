class AddCourseToUniversity < ActiveRecord::Migration
  def change
    add_reference :courses, :university, index: true
  end
end
