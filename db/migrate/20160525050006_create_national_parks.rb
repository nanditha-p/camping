class CreateNationalParks < ActiveRecord::Migration
  def change
    create_table :national_parks do |t|
      t.string :state
      t.string :name
    end
  end
end
