class AddRoadTripForecastsToRoadTrip < ActiveRecord::Migration[5.2]
  def change
    add_reference :road_trips, :road_trip_forecasts, foreign_key: true
  end
end
