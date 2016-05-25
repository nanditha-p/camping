class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t|
      t.float :length
      t.integer :rating
      t.integer :difficulty
      t.string :name
      t.text :notes
      t.belongs_to :national_park
      t.belongs_to :hike_type

      t.timestamps
    end
  end
end
