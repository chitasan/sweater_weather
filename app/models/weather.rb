class Weather
  attr_reader :latitude,
              :longitude
  
  def initialize(latitude, longitude)
    @latitude  = latitude
    @longitude = longitude
  end
  
  def current_weather
    {
      temperature: current_weather_data[:temperature],
      feels_like: current_weather_data[:apparentTemperature],
      temp_high: today_weather_data[:temperatureHigh],
      temp_low: today_weather_data[:temperatureLow],
      humidity: current_weather_data[:humidity],
      visibility: current_weather_data[:visibility],
      uv_index: current_weather_data[:uvIndex],
      today_summary: today_weather_data[:summary],
      current_summary: current_weather_data[:summary],
      icon: current_weather_data[:icon]
    }
  end
  
  def weather_hours(hours)
    (0...hours).map do |hour_index|
      weather_hour(hour_index)
    end
  end
  
  def weather_days(days)
    (0...days).map do |day_index|
      weather_day(day_index)
    end
  end
  
  private
  
  def current_weather_data
    weather_data[:currently]
  end
  
  def today_weather_data
    weather_data[:daily][:data].first
  end
  
  def weather_hour(index)
    {
      time: hourly_weather_data[index][:time],
      temperature: hourly_weather_data[index][:temperature],
      icon: hourly_weather_data[index][:icon]
    }
  end
  
  def weather_day(index)
    {
      date: Time.at(daily_weather_data[index][:time]).strftime('%Y-%m-%d'),
      icon: daily_weather_data[index][:icon],
      summary: daily_weather_data[index][:summary],
      precip_probability: daily_weather_data[index][:precipProbability],
      precip_type: daily_weather_data[index][:precipType],
      temp_high: daily_weather_data[index][:temperatureHigh],
      temp_low: daily_weather_data[index][:temperatureLow]
    }
  end
  
  def daily_weather_data
    weather_data[:daily][:data]
  end
  
  def hourly_weather_data
    weather_data[:hourly][:data]
  end
  
  def weather_data
    @weather_data ||= weather_service.get_weather
  end

  def weather_service
    @weather_service ||= WeatherService.new(@latitude, @longitude)
  end
end