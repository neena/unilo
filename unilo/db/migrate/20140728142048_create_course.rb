class CreateCourse < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :url
      t.string :title
      t.integer :year_abroad?
      t.string :kisid
      t.integer :fee
      t.float :satisfaction
      t.string :offer
      t.integer :salary_6m
      t.integer :salary_40m
      t.timestamps
    end
  end
end
