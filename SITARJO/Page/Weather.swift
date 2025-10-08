//
//  Weather.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI

struct Weather: View {
    
    @State private var coolTempIsOn: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.abuKecil
            VStack(alignment: .leading){
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 1).fill(Color.white)
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
                                    Text("22°C").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                }
//                                Spacer()
                                VStack(alignment: .leading){
                                    HStack{
                                        Image("wind").foregroundStyle(Color.orange)
                                        Text("Wind Speed:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                    }
                                    Text("12 km/h").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "drop.degreesign").foregroundStyle(Color.blue)
                                        Text("Humidity:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                    }
                                    Text("65%").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                }
//                                Spacer()
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "cloud.heavyrain").foregroundStyle(Color.gray)
                                        Text("Rain Chance:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                    }
                                    Text("20%").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
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
                                    Text("6/10").font(.system(size: 14)).foregroundStyle(Color.white)
                                }.frame(width: 42, height: 22)
                            }.padding()
                            
                        }.padding(.horizontal,16).padding(.top,8).frame(height: 60)
                        
                        Spacer()
                        
                        Text("Next 3 hours").padding(.horizontal,16).padding(.vertical,16)
                        
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                VStack{
                                    Text("11:00").font(.system(size: 12)).foregroundStyle(Color.abuTulisan)
                                    Image("sun")
                                    Text("23°C").font(.system(size: 12))
                                }
                            }.frame(width: 114, height: 72)
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                VStack{
                                    Text("12:00").font(.system(size: 12)).foregroundStyle(Color.abuTulisan)
                                    Image(systemName: "cloud").padding(.vertical,1).foregroundStyle(Color.gray)
                                    Text("24°C").font(.system(size: 12))
                                }
                            }.frame(width: 114, height: 72)
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                VStack{
                                    Text("13:00").font(.system(size: 12)).foregroundStyle(Color.abuTulisan)
                                    Image(systemName: "cloud.heavyrain").padding(.vertical,1).foregroundStyle(Color.blue)
                                    Text("21°C").font(.system(size: 12))
                                }
                            }.frame(width: 114, height: 72)
                        }.padding(.horizontal,16)
                        
                        Spacer()
                        
                        ZStack(alignment: .center){
                            RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1).fill(Color.blue.opacity(0.2))
                            
                            HStack{
                                Image(systemName: "cloud.heavyrain").padding(.vertical,1).foregroundStyle(Color.blue)
                                VStack(alignment: .leading){
                                    Text("Auto-Retract on Rain").font(.system(size: 16))
                                }
                                Spacer()
                                Toggle(isOn: $coolTempIsOn){
                                    
                                }.padding().scaleEffect(0.7).frame(width: 32 ,height: 18.5)
                            }.padding(.horizontal,16)
                            
                        }.padding(.horizontal,16).padding(.top,8).frame(height: 60)
                        
                        Spacer()
                    }
                    
                }.frame(height: 570)
            }.padding(.top,20)
        }
    }
}

#Preview {
    Weather()
}
