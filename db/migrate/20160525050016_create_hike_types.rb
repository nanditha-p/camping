class CreateHikeTypes < ActiveRecord::Migration
  def change
    create_table :hike_types do |t|
      t.string :type
    end
  end
end
