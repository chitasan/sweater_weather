class RoadTrip < ActiveRecord::Migration[5.2]
  def change
   create_table :road_trips do |t|
      t.string :city

      t.timestamps
    end
  end 
end
