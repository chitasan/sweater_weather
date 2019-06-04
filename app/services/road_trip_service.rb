class RoadTripService
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_distance
    get_roadtrip_json[:routes][0][:legs][0][:duration][:text]
  end 

  private

   def get_roadtrip_json
    response = roadtrip_conn.get
    JSON.parse(response.body, symbolize_names: true)
  end 

  def roadtrip_conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/directions/json') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.params['origin'] = "#{@origin}"
      faraday.params['destination'] = "#{@destination}"
      faraday.adapter Faraday.default_adapter
    end 
  end 
end 