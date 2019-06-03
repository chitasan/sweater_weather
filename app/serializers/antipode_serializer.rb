class AntipodeSerializer
  include FastJsonapi::ObjectSerializer

  set_id :object_id
  attributes :city, :state
end