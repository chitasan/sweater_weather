class RoadTripForecast < ActiveRecord::Migration[5.2]
  def change
    create_table :road_trip_forecasts do |t|
      t.string :summary
      t.string :current_temperature

      t.timestamps
    end
  end
end
