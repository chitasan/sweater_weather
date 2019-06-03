class AntipodeService
  def initialize(lat, long)
    @lat  = lat
    @long = long
  end 

  private 

  def antipode_conn
    Faraday.new(url: 'http://amypode.herokuapp.com') do |faraday|
      faraday.headers['api_key'] = ENV['AMYPODE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end 
end 