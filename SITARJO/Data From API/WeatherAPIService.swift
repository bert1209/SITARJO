//
//  WeatherAPIService.swift
//  SITARJO
//
//  Created by prk on 18/10/25.
//
import Foundation
import Combine
import CoreLocation

class WeatherService: ObservableObject {
    static let shared = WeatherService() // Singleton pattern
    
    @Published var weatherData: WeatherData?
    @Published var oneCallData: ProcessedWeatherData?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let apiKey1 = "99229bff95270ae2fa6829889ca0e524"
    private let apiKey2 = "4fe9f9b874734260079cd8ca5513f442"
    private var cancellables = Set<AnyCancellable>()
    
    private init() {} // Private init untuk singleton
    
    func fetchWeatherData(for location: CLLocation) {
        isLoading = true
        errorMessage = nil
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(apiKey1)&units=metric"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.weatherData = WeatherData(
                        locationName: weatherResponse.name,
                        temperature: weatherResponse.main.temp,
                        condition: weatherResponse.weather.first?.description ?? "",
                        humiditys: weatherResponse.main.humidity,
                        winds: weatherResponse.wind.speed
                    )
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
    
    func fetchWeatherDataForJakarta() {
        isLoading = true
        errorMessage = nil
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Jakarta&appid=\(apiKey1)&units=metric"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No data received"
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.weatherData = WeatherData(
                        locationName: weatherResponse.name,
                        temperature: weatherResponse.main.temp,
                        condition: weatherResponse.weather.first?.description ?? "",
                        humiditys: weatherResponse.main.humidity,
                        winds: weatherResponse.wind.speed
                    )
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to decode: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
    
    func fetchOneCallData(for location: CLLocation) {
            isLoading = true
            errorMessage = nil
            
            // OneCall API 3.0 endpoint
            let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&exclude=minutely,daily,alerts&appid=\(apiKey2)&units=metric"
            
            guard let url = URL(string: urlString) else {
                errorMessage = "Invalid URL"
                isLoading = false
                return
            }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        self.errorMessage = "No data received"
                    }
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let oneCallResponse = try decoder.decode(OneCallResponse.self, from: data)
                    
                    // Process data
                    let processedData = self.processOneCallData(oneCallResponse)
                    
                    DispatchQueue.main.async {
                        self.oneCallData = processedData
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Failed to decode OneCall: \(error.localizedDescription)"
                    }
                    print("Decoding error: \(error)")
                }
            }.resume()
        }
        
        func fetchOneCallDataForJakarta() {
            // Jakarta coordinates
            let jakartaLat = -6.2088
            let jakartaLon = 106.8456
            
            isLoading = true
            errorMessage = nil
            
            let urlString = "https://api.openweathermap.org/data/3.0/onecall?lat=\(jakartaLat)&lon=\(jakartaLon)&exclude=minutely,daily,alerts&appid=\(apiKey2)&units=metric"
            
            guard let url = URL(string: urlString) else {
                errorMessage = "Invalid URL"
                isLoading = false
                return
            }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                
                if let error = error {
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        self.errorMessage = "No data received"
                    }
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let oneCallResponse = try decoder.decode(OneCallResponse.self, from: data)
                    
                    let processedData = self.processOneCallData(oneCallResponse)
                    
                    DispatchQueue.main.async {
                        self.oneCallData = processedData
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Failed to decode OneCall: \(error.localizedDescription)"
                    }
                    print("Decoding error: \(error)")
                }
            }.resume()
        }
        
        // MARK: - Helper Functions
        private func processOneCallData(_ response: OneCallResponse) -> ProcessedWeatherData {
            let uvIndex = response.current.uvi
            
            // Current rain chance (jika ada rain data, anggap 100%, jika tidak cek weather condition)
            let currentRainChance: Double
            if response.current.rain != nil {
                currentRainChance = 1.0
            } else {
                // Cek weather condition ID untuk rain (500-531 adalah rain codes)
                let hasRain = response.current.weather.contains { $0.id >= 500 && $0.id < 600 }
                currentRainChance = hasRain ? 0.8 : 0.0
            }
            
            // Ambil 3 jam pertama dari hourly forecast
            let hour1 = response.hourly.indices.contains(1) ? response.hourly[1] : response.hourly[0]
            let hour2 = response.hourly.indices.contains(2) ? response.hourly[2] : response.hourly[0]
            let hour3 = response.hourly.indices.contains(3) ? response.hourly[3] : response.hourly[0]
            
            return ProcessedWeatherData(
                uvIndex: uvIndex,
                currentRainChance: currentRainChance,
                hour1Forecast: createHourlyForecast(from: hour1),
                hour2Forecast: createHourlyForecast(from: hour2),
                hour3Forecast: createHourlyForecast(from: hour3)
            )
        }
        
        private func createHourlyForecast(from hourly: HourlyWeather) -> HourlyForecast {
            let time = Date(timeIntervalSince1970: TimeInterval(hourly.dt))
            
            return HourlyForecast(
                time: time,
                temperature: hourly.temp,
                rainChance: hourly.pop, // Probability of precipitation
                condition: hourly.weather.first?.description ?? "Unknown",
                humidity: hourly.humidity
            )
        }
        
        // MARK: - Fetch Both APIs
        func fetchAllWeatherData(for location: CLLocation) {
            // Fetch basic weather data
            fetchWeatherData(for: location)
            
            // Fetch OneCall data
            fetchOneCallData(for: location)
        }
        
        func fetchAllWeatherDataForJakarta() {
            fetchWeatherDataForJakarta()
            fetchOneCallDataForJakarta()
        }
}
