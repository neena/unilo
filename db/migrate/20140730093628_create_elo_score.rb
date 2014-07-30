class CreateEloScore < ActiveRecord::Migration
  def change
    create_table :elo_scores do |t|
      t.integer :score
      t.references :university
      t.references :user
    end
  end
end
