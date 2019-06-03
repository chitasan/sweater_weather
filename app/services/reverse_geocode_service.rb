class ReverseGeocodeService

  def initialize(lat, long)
    @lat = lat.to_i
    @long = long.to_i
    #round to four dec? 
  end

  def get_city
    get_location_json[:results][0][:address_components][1][:short_name]
  end 

  def get_state
    get_location_json[:results][0][:address_components][3][:short_name]
  end 

  private 

  def get_location_json
    response = reverse_geocode_conn.get
    JSON.parse(response.body, symbolize_names: true)
  end 

  def reverse_geocode_conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.params['latlng'] = "#{@lat},#{@long}"
      faraday.adapter Faraday.default_adapter
    end 
  end
end 