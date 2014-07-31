class AddDescriptionToUni < ActiveRecord::Migration
  def change
    add_column :universities, :description, :text
  end
end
