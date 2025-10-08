//
//  EnvironmentPage.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI

struct Overview: View {
    
    @State private var tempIsOn: Bool = false
    @State private var rainIsOn: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.abuKecil
            VStack(alignment: .leading){
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 1).fill(Color.white)
                    VStack(alignment: .leading){
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
                                    Text("22°C").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                }
                                Spacer()
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
                                Spacer()
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "cloud.heavyrain").foregroundStyle(Color.gray)
                                        Text("Wind Speed:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                    }
                                    Text("12 km/h").font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                }
                                
                                
                            }
                            Spacer()
                        }.padding()
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
    Overview()
}
