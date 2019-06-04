class RoadTripForecastsSerializer
  include FastJsonapi::ObjectSerializer

  set_id :object_id
  attributes :city, :state
  
  attribute :arrival_forecast do |object|
    object.get_destination_arrival_weather
  end
end