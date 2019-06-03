class AntipodeSerializer
  include FastJsonapi::ObjectSerializer

  set_id :object_id
  attributes :forecast, :location_name, :search_location
end