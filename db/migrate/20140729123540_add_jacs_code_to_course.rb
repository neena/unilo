class AddJacsCodeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :jacs, :string
  end
end
