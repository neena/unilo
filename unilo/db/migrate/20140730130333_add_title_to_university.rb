class AddTitleToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :title, :string
  end
end
