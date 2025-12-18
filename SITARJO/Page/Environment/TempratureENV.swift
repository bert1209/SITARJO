//
//  Temprature.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI
import CoreLocation

struct TempratureENV: View {
    
    @State var sliderValue: Double = 20
    @State private var highTempIsOn: Bool = false
    @State private var coolTempIsOn: Bool = false
    @StateObject private var locationManager = LocationManager()
    @StateObject private var weatherService = WeatherService.shared
    @State private var statusMessage: String = ""
    
    private let apiService = ApiService.shared
    
    func sendSuhuUpdate() {
        let suhuInt = Int(sliderValue)
            statusMessage = "Mengirim \(suhuInt)°C..."
            
            apiService.setSuhuThreshold(suhu: suhuInt) { success, message in
                if success {
                    statusMessage = "Berhasil: \(message)"
                } else {
                    statusMessage = "Gagal: \(message)"
                }
            }
        }
        
        func loadSettings() {
            // Anda perlu fungsi fetchData() di ApiService
            // yang mengembalikan DeviceData
            apiService.fetchData { result in
                switch result {
                case .success(let data):
                    self.sliderValue = Double(data.suhu_minimal)
                case .failure(let error):
                    statusMessage = "Gagal memuat pengaturan: \(error.localizedDescription)"
                }
            }
            
        }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.abuKecil
            VStack(alignment: .leading){
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 1).fill(Color.white)
                    VStack(alignment: .leading){
                        if let weatherData = weatherService.weatherData {
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
                            
                            Slider(value: $sliderValue, in: 0...50,
                                   onEditingChanged: { isEditing in
                                if !isEditing {
                                    sendSuhuUpdate()
                                }
                            })
                                .padding(.horizontal,16)
                            Text("Clothesline will automatically retract when temperature exceeds this value").foregroundStyle(Color.abuTulisan).font(.system(size: 12)).padding(.horizontal,16)
                            
                  
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
                    }.onAppear{
                        locationManager.requestLocation()
                    }
                    .onReceive(locationManager.$location) {location in
                        guard let location = location else {return}
                        weatherService.fetchWeatherDataForJakarta()
                    }
                    
                }.frame(height: 420)
            }.padding(.top,10)
        }
      
    }
}

#Preview {
    TempratureENV()
}
