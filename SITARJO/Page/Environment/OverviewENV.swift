//
//  EnvironmentPage.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI
import CoreLocation

struct OverviewENV: View {
    
    @State private var tempIsOn: Bool = false
    @State private var rainIsOn: Bool = false
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
                                Image(systemName: "powermeter").foregroundStyle(Color.blue)
                                Text("Current Condition").font(.system(size: 16))
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
                                    Spacer()
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
                                    Spacer()
                                    VStack(alignment: .leading){
                                        HStack{
                                            Image(systemName: "cloud.heavyrain").foregroundStyle(Color.gray)
                                            Text("Rain Chance:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                        }
                                        Text("20%").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                    }
                                    
                                    
                                }
                                Spacer()
                            }.padding()
                        }
                    }.onAppear{
                        locationManager.requestLocation()
                    }
                    .onReceive(locationManager.$location) {location in
                        guard let location = location else {return}
                        fetchWeatherData(for: location)
                    }
                    
                }.frame(height: 172)
                
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 14).stroke(Color.stroke, lineWidth: 1.11).fill(Color.white)
                    VStack(alignment: .leading){
                        Text("Enviromental Controls").padding(.leading,16).padding(.top,25)
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Auto-Retract on High Temp").font(.system(size: 14))
                                Text("Current threshold: 25°C").font(.system(size: 12)).foregroundStyle(Color.gray)
                            }.frame(width: 200, alignment: .leading)
                            Toggle(isOn: $tempIsOn){
                                
                            }.scaleEffect(0.7).padding()
                        }.padding(.leading,16)
                        HStack{
                            VStack(alignment: .leading){
                                Text("Auto-Retract on Rain").font(.system(size: 14))
                                Text("Activates when rain detected").font(.system(size: 12)).foregroundStyle(Color.gray).lineLimit(1)
                            }.frame(width: 200, alignment: .leading)
                            Toggle(isOn: $rainIsOn){
                                
                            }.padding().scaleEffect(0.7)
                        }.padding(.leading,16)
                        
                    }
                    
                }.frame(height: 200).padding(.top,25)
            }.padding(.top,30)
        }
    }
}
#Preview {
    OverviewENV()
}
