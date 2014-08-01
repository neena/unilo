class CreateJacsCodes < ActiveRecord::Migration
  def change
    create_table :jacs_codes do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end
