class AddImageUrlToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :image_url, :string
  end
end
