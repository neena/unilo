class AddModeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :mode, :integer
  end
end
