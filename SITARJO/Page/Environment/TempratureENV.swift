//
//  Temprature.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI
import CoreLocation

struct TempratureENV: View {
    
    @State var sliderValue: Double = 10
    @State private var highTempIsOn: Bool = false
    @State private var coolTempIsOn: Bool = false
    @StateObject private var locationManager = LocationManager()
    @State private var weatherData: WeatherData?
    
    
    private func fetchWeatherData(for location :CLLocation){
        let apiKey = "99229bff95270ae2fa6829889ca0e524"
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(apiKey)&units=metric" //ambil sesuai kordinat hp
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=Jakarta&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {return} // ambil wilayah Jakarta
        
        URLSession.shared.dataTask(with: url) {data, _ , error in
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try
                decoder.decode(WeatherResponse.self, from: data)
                
                DispatchQueue.main.async{
                    weatherData  = WeatherData(locationName: weatherResponse.name, temperature: weatherResponse.main.temp, condition: weatherResponse.weather.first?.description ?? "", humiditys: weatherResponse.main.humidity, winds: weatherResponse.wind.speed)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.abuKecil
            VStack(alignment: .leading){
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 1).fill(Color.white)
                    VStack(alignment: .leading){
                        if let weatherData = weatherData {
                            HStack{
                                Image(systemName: "thermometer.variable").foregroundStyle(Color.orange)
                                Text("Temperature Control").font(.system(size: 16))
                            }.padding(.horizontal,16).padding(.top,16)
                            HStack{
                                Spacer()
                                Text(
                                    "\(Int(weatherData.temperature))°C").font(.system(size: 30)).padding(.top,16)
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Text("Current Temprature").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                Spacer()
                            }.padding(.top,1)
                            
                            HStack{
                                Text("Auto-Retract Temprature").font(.system(size: 14))
                                Spacer()
                                Text(String(format: "%.1f°C", sliderValue)).font(.system(size: 14))
                            }.padding(.horizontal,16).padding(.top,16)
                            
                            Slider(value: $sliderValue, in: 0...50)
                                .padding(.horizontal,16)
                            Text("Clothesline will automatically retract when temperature exceeds this value").foregroundStyle(Color.abuTulisan).font(.system(size: 12)).padding(.horizontal,16)
                            
                            VStack(alignment: .leading){
                                
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Auto-Retract on High Temp").font(.system(size: 14))
                                        Text("Automatically retract when temperature is too high").font(.system(size: 12)).foregroundStyle(Color.gray)
                                    }.frame(width: 200, alignment: .leading)
                                    Toggle(isOn: $highTempIsOn){
                                        
                                    }.scaleEffect(0.7).padding()
                                }.padding(.horizontal,16)
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Auto-Retract on Cool Temp").font(.system(size: 14))
                                        Text("Automatically extend when temperature is optimal").font(.system(size: 12)).foregroundStyle(Color.gray)
                                    }.frame(width: 200, alignment: .leading)
                                    Toggle(isOn: $coolTempIsOn){
                                        
                                    }.padding().scaleEffect(0.7)
                                }.padding(.horizontal,16)
                                
                            }
                            
                            ZStack(alignment: .topLeading){
                                RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Temperature Zones").font(.system(size: 16))
                                    }.padding(.horizontal,16).padding(.top,16)
                                    
                                    HStack{
                                        Text("Optimal (15-25°C)").font(.system(size: 14)).foregroundStyle(Color.green)
                                        Spacer()
                                        Text("Auto-extend Enabled").font(.system(size: 14))
                                    }.padding(.horizontal,16).padding(.top,2)
                                    HStack{
                                        Text("Warm (25-30°C)").font(.system(size: 14)).foregroundStyle(Color.orange)
                                        Spacer()
                                        Text("Monitor Closely").font(.system(size: 14))
                                    }.padding(.horizontal,16)
                                    HStack{
                                        Text("Hot (30°C+)").font(.system(size: 14)).foregroundStyle(Color.red)
                                        Spacer()
                                        Text("Auto-retract activated").font(.system(size: 14))
                                    }.padding(.horizontal,16)
                                }.padding(.vertical,8)
                                
                            }.padding(.horizontal,16).padding(.top,8).frame(height: 142)
                            
                        }
                    }.onAppear{
                        locationManager.requestLocation()
                    }
                    .onReceive(locationManager.$location) {location in
                        guard let location = location else {return}
                        fetchWeatherData(for: location)
                    }
                    
                }.frame(height: 570)
            }.padding(.top,20)
        }
      
    }
}

#Preview {
    TempratureENV()
}
