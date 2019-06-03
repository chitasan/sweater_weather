class AntipodeService
  def initialize(lat, long)
    @lat  = lat.to_i
    @long = long.to_i
  end

  def get_lat
    get_lat_long[:lat].to_s
  end

  def get_long
     get_lat_long[:long].to_s
  end 

  private

  def get_lat_long
    get_antipode_json[:data][:attributes]
  end 

  def get_antipode_json
    response = antipode_conn.get("/api/v1/antipodes?lat=#{@lat}&long=#{@long}")
    JSON.parse(response.body, symbolize_names: true)
  end 

  def antipode_conn
    Faraday.new(url: 'http://amypode.herokuapp.com/') do |faraday|
      faraday.headers['api_key'] = ENV['AMYPODE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end 
end 

# class AmypodeService < ApplicationService
#   def get_antipode(location)
#     lat = location.latitude.to_i
#     long = location.longitude.to_i
#     get_json("/api/v1/antipodes?lat=#{lat}&long=#{long}", authenticate!)
#   end

#   private

#   def authenticate!
#     ENV['AMYPODE_KEY']
#   end
# end
