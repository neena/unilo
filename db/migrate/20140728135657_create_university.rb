class CreateUniversity < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :ukprn
      t.float :latitude
      t.float :longitude
      t.string :location
      t.integer :private_accomodation_q3
      t.integer :private_accomodation_q1
      t.integer :public_accomodation_q3
      t.integer :public_accomodation_q1
      t.timestamps
    end
  end
end
