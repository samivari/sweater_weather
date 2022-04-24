require 'rails_helper'
RSpec.describe Forecast do
  it 'creates a forecast from complex hash' do
    data =
      { current_weather: { dt: 1_646_709_097, sunrise: 1_646_659_304, sunset: 1_646_701_045, temp: 24.55, feels_like: 18.75, pressure: 1026, humidity: 82, dew_point: 20.37, uvi: 0, clouds: 100, visibility: 805, wind_speed: 4.61, wind_deg: 30, weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04n' }] },
        hourly_weather: [{ dt: 1_646_708_400, temp: 24.55, feels_like: 16.47, pressure: 1026, humidity: 82, dew_point: 20.37, uvi: 0, clouds: 100, visibility: 10_000, wind_speed: 7.07, wind_deg: 53, wind_gust: 7.34, weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04n' }], pop: 0.21 },
                         { dt: 1_646_712_000, temp: 24.51, feels_like: 19.31, pressure: 1026, humidity: 81, dew_point: 20.08, uvi: 0,
                           clouds: 100, visibility: 10_000, wind_speed: 4.09, wind_deg: 75, wind_gust: 4.43, weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04n' }], pop: 0.35 },
                         { dt: 1_646_715_600, temp: 24.57, feels_like: 20.88, pressure: 1026, humidity: 83, dew_point: 20.64, uvi: 0,
                           clouds: 100, visibility: 9902, wind_speed: 3.02, wind_deg: 105, wind_gust: 2.98, weather: [{ id: 600, main: 'Snow', description: 'light snow', icon: '13n' }], pop: 0.4, snow: { "1h": 0.1 } },
                         { dt: 1_646_719_200, temp: 24.73, feels_like: 24.73, pressure: 1026, humidity: 85, dew_point: 21.31, uvi: 0,
                           clouds: 99, visibility: 9604, wind_speed: 2.8, wind_deg: 138, wind_gust: 2.44, weather: [{ id: 600, main: 'Snow', description: 'light snow', icon: '13n' }], pop: 0.4, snow: { "1h": 0.1 } },
                         { dt: 1_646_722_800, temp: 24.58, feels_like: 24.58, pressure: 1026, humidity: 90, dew_point: 22.37, uvi: 0,
                           clouds: 100, visibility: 801, wind_speed: 2.59, wind_deg: 211, wind_gust: 2.73, weather: [{ id: 600, main: 'Snow', description: 'light snow', icon: '13n' }], pop: 0.28, snow: { "1h": 0.17 } },
                         { dt: 1_646_726_400, temp: 24.8, feels_like: 24.8, pressure: 1025, humidity: 90, dew_point: 21.45, uvi: 0,
                           clouds: 100, visibility: 1088, wind_speed: 2.89, wind_deg: 243, wind_gust: 3.38, weather: [{ id: 600, main: 'Snow', description: 'light snow', icon: '13n' }], pop: 0.24, snow: { "1h": 0.22 } },
                         { dt: 1_646_730_000, temp: 24.94, feels_like: 20.77, pressure: 1024, humidity: 86, dew_point: 20.48, uvi: 0,
                           clouds: 100, visibility: 10_000, wind_speed: 3.38, wind_deg: 253, wind_gust: 4.43, weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04n' }], pop: 0.16 },
                         { dt: 1_646_733_600, temp: 23.74, feels_like: 23.74, pressure: 1023, humidity: 88, dew_point: 19.78, uvi: 0,
                           clouds: 95, visibility: 10_000, wind_speed: 2.57, wind_deg: 207, wind_gust: 3.02, weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04n' }], pop: 0.12 }],
        daily_weather: [{ dt: 1_646_679_600,
                          sunrise: 1_646_659_304,
                          sunset: 1_646_701_045,
                          moonrise: 1_646_668_920,
                          moonset: 1_646_720_520,
                          moon_phase: 0.17,
                          temp: { day: 26.08, min: 16.54, max: 29.75, night: 24.73, eve: 25.66, morn: 16.54 },
                          feels_like: { day: 17.55, night: 24.73, eve: 17.17, morn: 8.76 },
                          pressure: 1029,
                          humidity: 59,
                          dew_point: 12.79,
                          wind_speed: 8.75,
                          wind_deg: 115,
                          wind_gust: 10.07,
                          weather: [{ id: 600, main: 'Snow', description: 'light snow', icon: '13d' }],
                          clouds: 100,
                          pop: 0.4,
                          snow: 0.2,
                          uvi: 4.14 },
                        { dt: 1_646_766_000,
                          sunrise: 1_646_745_615,
                          sunset: 1_646_787_504,
                          moonrise: 1_646_757_180,
                          moonset: 0,
                          moon_phase: 0.2,
                          temp: { day: 36.27, min: 21.4, max: 40.66, night: 29.77, eve: 36.09, morn: 21.4 },
                          feels_like: { day: 32.7, night: 24.26, eve: 28.92, morn: 21.4 },
                          pressure: 1018,
                          humidity: 44,
                          dew_point: 16.02,
                          wind_speed: 9.71,
                          wind_deg: 93,
                          wind_gust: 14.7,
                          weather: [{ id: 600, main: 'Snow', description: 'light snow', icon: '13d' }],
                          clouds: 7,
                          pop: 0.28,
                          snow: 0.39,
                          uvi: 4.22 },
                        { dt: 1_646_852_400,
                          sunrise: 1_646_831_925,
                          sunset: 1_646_873_963,
                          moonrise: 1_646_845_620,
                          moonset: 1_646_810_520,
                          moon_phase: 0.23,
                          temp: { day: 41.16, min: 18.09, max: 42.06, night: 18.09, eve: 25.21, morn: 26.17 },
                          feels_like: { day: 34.11, night: 7.54, eve: 12.61, morn: 26.17 },
                          pressure: 1009,
                          humidity: 37,
                          dew_point: 16.21,
                          wind_speed: 23.71,
                          wind_deg: 18,
                          wind_gust: 26.13,
                          weather: [{ id: 601, main: 'Snow', description: 'snow', icon: '13d' }],
                          clouds: 26,
                          pop: 0.92,
                          snow: 3.58,
                          uvi: 4.24 },
                        { dt: 1_646_938_800,
                          sunrise: 1_646_918_234,
                          sunset: 1_646_960_422,
                          moonrise: 1_646_934_360,
                          moonset: 1_646_900_520,
                          moon_phase: 0.25,
                          temp: { day: 19.11, min: 14.45, max: 21.34, night: 18.73, eve: 19.65, morn: 14.45 },
                          feels_like: { day: 7.84, night: 14.2, eve: 10.11, morn: 3.56 },
                          pressure: 1024,
                          humidity: 73,
                          dew_point: 10.72,
                          wind_speed: 10.16,
                          wind_deg: 107,
                          wind_gust: 12.44,
                          weather: [{ id: 601, main: 'Snow', description: 'snow', icon: '13d' }],
                          clouds: 100,
                          pop: 1,
                          snow: 4.47,
                          uvi: 4.01 },
                        { dt: 1_647_025_200,
                          sunrise: 1_647_004_543,
                          sunset: 1_647_046_880,
                          moonrise: 1_647_023_580,
                          moonset: 1_646_990_280,
                          moon_phase: 0.29,
                          temp: { day: 26.47, min: 9.25, max: 30.87, night: 21.31, eve: 29.17, morn: 9.25 },
                          feels_like: { day: 19.69, night: 21.31, eve: 21.15, morn: -0.15 },
                          pressure: 1029,
                          humidity: 57,
                          dew_point: 12.42,
                          wind_speed: 10.04,
                          wind_deg: 153,
                          wind_gust: 9.8,
                          weather: [{ id: 800, main: 'Clear', description: 'clear sky', icon: '01d' }],
                          clouds: 2,
                          pop: 0.21,
                          uvi: 4.9 }] }
    forecast = Forecast.new(data)
    expect(forecast).to be_a(Forecast)
    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.current_weather).to have_key(:datetime)
    expect(forecast.current_weather).to have_key(:sunrise)
    expect(forecast.current_weather).to have_key(:sunset)
    expect(forecast.current_weather).to have_key(:temperature)
    expect(forecast.current_weather).to have_key(:feels_like)
    expect(forecast.current_weather).to have_key(:humidity)
    expect(forecast.current_weather).to have_key(:uvi)
    expect(forecast.current_weather).to have_key(:visibility)
    expect(forecast.current_weather).to have_key(:conditions)
    expect(forecast.current_weather).to have_key(:icon)

    expect(forecast.daily_weather).to be_an(Array)
    forecast.daily_weather.each do |day|
      expect(day).to have_key(:date)
      expect(day).to have_key(:sunrise)
      expect(day).to have_key(:sunset)
      expect(day).to have_key(:max_temp)
      expect(day).to have_key(:min_temp)
      expect(day).to have_key(:conditions)
      expect(day).to have_key(:icon)
    end

    expect(forecast.hourly_weather).to be_an(Array)
    forecast.hourly_weather.each do |hour|
      expect(hour).to have_key(:time)
      expect(hour).to have_key(:temperature)
      expect(hour).to have_key(:conditions)
      expect(hour).to have_key(:icon)
    end
  end
end
