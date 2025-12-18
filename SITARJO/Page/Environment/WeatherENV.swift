//
//  Weather.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI
import CoreLocation

struct WeatherENV: View {
    
//    @State private var coolTempIsOn: Bool = false
    @StateObject private var locationManager = LocationManager()
//    @State private var weatherData: WeatherData?
    @StateObject private var weatherService = WeatherService.shared
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.abuKecil
                VStack(alignment: .leading){
                    if let weatherData = weatherService.weatherData,
                       let oneCallData = weatherService.oneCallData{
                        ZStack(alignment: .topLeading){
                            RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 2).fill(Color.white)
                            VStack(alignment: .leading){
                            
            
                                HStack{
                                    Image(systemName: "cloud").foregroundStyle(Color.gray)
                                    Text("Weather Control").font(.system(size: 16))
                                }.padding(.horizontal,16).padding(.top,16)
                        
                                HStack{
                                    VStack(alignment: .leading) {
                                        VStack(alignment: .leading){
                                            HStack{
                                                Image(systemName: "thermometer.variable").foregroundStyle(Color.orange)
                                                Text("Temprature:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                            }
                    
                                            Text("\(Int(weatherData.temperature))°C").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                        }
    //                                    Spacer()
                                        VStack(alignment: .leading){
                                            HStack{
                                                Image("wind").foregroundStyle(Color.orange)
                                                Text("Wind Speed").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                            }
                                            Text("\(Int(weatherData.winds)) km/h").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        VStack(alignment: .leading){
                                            HStack{
                                                Image(systemName: "drop.degreesign").foregroundStyle(Color.blue)
                                                Text("Humidity:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                            }
                                           
                                            Text("\(Int(weatherData.humiditys))%").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                        }
                        
                                        VStack(alignment: .leading){
                                            HStack{
                                                Image(systemName: "cloud.heavyrain").foregroundStyle(Color.gray)
                                                Text("Rain Chance:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                            }
                                         
                                            Text("\(Int(oneCallData.hour1Forecast.rainChance * 100))%").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold).padding(.top,1)
                                        }.padding(.top,1)
                                        
                                        
                                    }
                                    Spacer()
                                }.padding()
                                
                                Spacer()
                                
                                ZStack(alignment: .topLeading){
                                    RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                    
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text("UV Index").font(.system(size: 16))
                                            Text("Current Level").font(.system(size: 12))
                                        }
                                        Spacer()
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 14).fill(Color.blue)
                                            Text("\(String(format: "%.1f", oneCallData.uvIndex/10))/10").font(.system(size: 14)).foregroundStyle(Color.white)
                                        }.frame(width: 50, height: 22)
                                    }.padding()
                                    
                                }.padding(.horizontal,16).padding(.top,8).frame(height: 60)
                                
                                Spacer()
                                
                                Text("Next 3 hours").padding(.horizontal,16).padding(.vertical,16)
                                
                                HStack{
                                    Spacer()
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                        VStack{
                                            Spacer()
                                            Text(formatTime(oneCallData.hour1Forecast.time)).font(.system(size: 12)).foregroundStyle(Color.abuTulisan)
                                            Spacer()
                                            Image(systemName: getWeatherIcon(for: oneCallData.hour1Forecast.condition)).foregroundStyle(getWeatherIconColor(for: oneCallData.hour1Forecast.condition))
                                            Spacer()
                                            Text("\(Int(oneCallData.hour1Forecast.temperature))°C").font(.system(size: 12))
                                            Spacer()
                                        }
                                    }.frame(width: 110, height: 72)
                                    Spacer()
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                        VStack{
                                            Spacer()
                                            Text(formatTime(oneCallData.hour2Forecast.time)).font(.system(size: 12)).foregroundStyle(Color.abuTulisan)
                                            Spacer()
                                            Image(systemName: getWeatherIcon(for: oneCallData.hour2Forecast.condition)).foregroundStyle(getWeatherIconColor(for: oneCallData.hour2Forecast.condition))
                                            Spacer()
                                            Text("\(Int(oneCallData.hour2Forecast.temperature))°C").font(.system(size: 12))
                                            Spacer()
                                        }
                                    }.frame(width: 110, height: 72)
                                    Spacer()
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                        VStack{
                                            Spacer()
                                            Text(formatTime(oneCallData.hour3Forecast.time)).font(.system(size: 12)).foregroundStyle(Color.abuTulisan)
                                            Spacer()
                                            Image(systemName: getWeatherIcon(for: oneCallData.hour3Forecast.condition)).foregroundStyle(getWeatherIconColor(for: oneCallData.hour3Forecast.condition))
                                            Spacer()
                                            Text("\(Int(oneCallData.hour3Forecast.temperature))°C").font(.system(size: 12))
                                            Spacer()
                                        }
                                    }.frame(width: 110, height: 72)
                                    Spacer()
                                }
                                
                                Spacer()
                                
                                ZStack(alignment: .center){
                                    RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1).fill(Color.blue.opacity(0.2))
                                    
                                    HStack{
                                        Spacer()
                                        Image(systemName: "cloud.heavyrain").padding(.vertical,1).foregroundStyle(Color.blue)
                                        VStack(alignment: .leading){
                                            Text("Auto-Retract on Rain").font(.system(size: 16))
                                        }
                                        Spacer()
//                                        Toggle(isOn: $coolTempIsOn){
//                                            
//                                        }.padding().scaleEffect(0.7).frame(width: 32 ,height: 18.5)
                                    }.padding(.horizontal,16)
                                    
                                }.padding(.horizontal,16).padding(.top,8).frame(height: 60)
                                Spacer()
                                
                            }
                            
                        }.frame(height: 580)
                    } else if weatherService.isLoading {
                        HStack {
                            Spacer()
                            ProgressView("Loading weather data...")
                            Spacer()
                        }.padding()
                    } else if let error = weatherService.errorMessage {
                        Text("Error: \(error)")
                            .foregroundStyle(Color.red)
                            .padding()
                    }
                }.padding(.top,10)
                .onAppear{
                    locationManager.requestLocation()
                }
                .onReceive(locationManager.$location) {location in
                    guard let location = location else {return}
                    weatherService.fetchAllWeatherDataForJakarta()
                }
            }
        }
    
    private func formatTime(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: date)
        }
        
    private func getWeatherIcon(for condition: String) -> String {
        let lowercased = condition.lowercased()
        
        if lowercased.contains("rain") {
            return "cloud.rain.fill"
        } else if lowercased.contains("cloud") {
            return "cloud"
        } else if lowercased.contains("clear") {
            return "sun.max.fill"
        } else if lowercased.contains("thunder") || lowercased.contains("storm") {
            return "cloud.bolt.rain.fill"
        } else if lowercased.contains("snow") {
            return "cloud.snow.fill"
        } else {
            return "cloud.sun.fill"
        }
    }
        
    private func getWeatherIconColor(for condition: String) -> Color {
        let lowercased = condition.lowercased()
        
        if lowercased.contains("rain") {
            return .blue
        } else if lowercased.contains("cloud") {
            return .gray
        } else if lowercased.contains("clear") {
            return .yellow
        } else if lowercased.contains("thunder") || lowercased.contains("storm") {
            return .gray
        } else if lowercased.contains("snow") {
            return .white
        } else {
            return .gray
        }
    }
    
    
}

#Preview {
    WeatherENV()
}
