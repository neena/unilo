class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :question_type
      t.integer :order
      t.string :identifier
      t.text :content
      t.timestamps
    end
  end
end
