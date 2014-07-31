class SortUrlOnCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :url
    add_column :courses, :url, :text
  end
end
