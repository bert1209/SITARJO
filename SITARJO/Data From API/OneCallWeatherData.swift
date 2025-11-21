//
//  Untitled.swift
//  SITARJO
//
//  Created by prk on 18/10/25.
//
import Foundation

struct OneCallResponse: Codable {
    let lat: Double
    let lon: Double
    let current: CurrentWeather
    let hourly: [HourlyWeather]
}

struct CurrentWeather: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let uvi: Double
    let weather: [WeatherDescription]
    
    // Rain bisa null, jadi optional
    let rain: RainData?
}

struct HourlyWeather: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let pop: Double // Probability of precipitation (0-1)
    let weather: [WeatherDescription]
    let rain: RainData?
}

struct RainData: Codable {
    let oneHour: Double?
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

struct WeatherDescription: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct ProcessedWeatherData {
    let uvIndex: Double
    let currentRainChance: Double
    let hour1Forecast: HourlyForecast
    let hour2Forecast: HourlyForecast
    let hour3Forecast: HourlyForecast
}

struct HourlyForecast {
    let time: Date
    let temperature: Double
    let rainChance: Double
    let condition: String
    let humidity: Int
}
