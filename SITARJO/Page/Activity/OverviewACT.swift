//
//  ActivityPage.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI

struct OverviewACT: View {
    
    
    @State private var espData: ESPData?
    @State private var statusMessage: String = "Loading Data.."
    
    let apiService = ApiService.shared
    @State var progress1 = 0.0
    @State var progress2 = 0.0
    
    func loadData() {
            apiService.fetchData { result in
                // Update UI harus di main thread
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self.espData = data
                        self.statusMessage = ""
                    case .failure(_):
                        print("eror")
                        self.statusMessage = "Loading Data"
                    }
                }
            }
        }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top){
                Color.abuKecil
                ScrollView{
                    if let data = espData{
                        VStack(alignment: .leading){
                            Spacer()
                            ZStack(alignment: .topLeading){
                                RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 1).fill(Color.white)
                                VStack(alignment: .leading){
                                    HStack{
                                        Image(systemName: "chart.bar.xaxis").foregroundStyle(Color.blue)
                                        Text("Today's Summary").font(.system(size: 16))
                                    }.padding(.horizontal,16).padding(.top,16)
                                    
                                    HStack{
                                        
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            VStack(alignment: .leading){
                                                Spacer()
                                                HStack{Image(systemName: "waveform.path.ecg")
                                                        .foregroundStyle(Color.green)
                                                    Text("Operations:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                }
                                                Spacer()
                                                Text(String(format: "%d", data.total_operations_today)).font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                               
                                            }
                                            Spacer()
                                            VStack(alignment: .leading){
                                                Spacer()
                                                HStack{
                                                    Image(systemName: "bolt").foregroundStyle(Color.orange)
                                                    Text("Efficiency").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                }
                                                Spacer()
                                                Text(String(format: "%.f%%", data.efficiency)).font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                                Spacer()
                                                ZStack(alignment: .leading){
                                                    Rectangle()
                                                        .fill(Color.biruProgress.opacity(0.2))
                                                        .frame(width :  geometry.size.width * 0.4, height: 12)
                                                    
                                                    Rectangle()
                                                        .fill(Color.biruProgress)
                                                        .frame(width: geometry.size.width * data.efficiency/100 * 0.4  ,height: 10)
                                                }.frame(maxWidth: .infinity)
                                                Spacer()
                                            }
                                            Spacer()
                                        }.frame(width: geometry.size.width * 0.4)
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            VStack(alignment: .leading){
                                                Spacer()
                                                HStack{
                                                    Image(systemName: "stopwatch").foregroundStyle(Color.orange)
                                                    Text("Total Duration").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                }
                                                Spacer()
                                                Text(String(format: "%.1f s", data.totalDuration)).font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                                
                                            }
                                            Spacer()
                                            VStack(alignment: .leading){
                                                Spacer()
                                                HStack{
                                                    Image(systemName: "powermeter").foregroundStyle(Color.green)
                                                    Text("Uptime").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                }
                                                Spacer()
                                                Text(String(format: "%.1f%%", progress2)).font(.system(size: 24)).foregroundStyle(Color.black).fontWeight(.bold)
                                                Spacer()
                                                ZStack(alignment: .leading){
                                                    Rectangle()
                                                        .fill(Color.biruProgress.opacity(0.2))
                                                        .frame(width: geometry.size.width * 0.4,height: 12)
                                                    
                                                    Rectangle()
                                                        .fill(Color.biruProgress)
                                                        .frame(width: geometry.size.width * progress2/100 * 0.4 ,height: 10)
                                                }.frame(maxWidth: .infinity)
                                                Spacer()
                                                
                                            }
                                            Spacer()
                                        }.frame(width: geometry.size.width * 0.4)
                                        Spacer()
                                    }.padding()
                                }
                                
                            }.frame(height: geometry.size.height * 0.25)
                            
                            Spacer()
                            
                            ZStack(alignment: .topLeading){
                                RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 1).fill(Color.white)
                                VStack(alignment: .leading){
                                    Spacer()
                                    HStack{
                                        Image(systemName: "target").foregroundStyle(Color.purple)
                                        Text("Operation Breakdown").font(.system(size: 16))
                                    }.padding(.horizontal, geometry.size.width * 0.04).padding(.bottom, geometry.size.width * 0.04)
                                    Spacer()
                                    HStack{
                                        Image(systemName: "circle.fill").foregroundStyle(Color.blue)
                                        Text("Manual Controls")
                                        Spacer()
                                        Text("\(data.manual_actions_today)")
                                        
                                    }.padding(.horizontal, geometry.size.width * 0.04)
                                    Spacer()
                                    HStack{
                                        Image(systemName: "circle.fill").foregroundStyle(Color.green)
                                        Text("Smart Automation")
                                        Spacer()
                                        Text("\(data.auto_actions_today)")
                                    }.padding(.horizontal, geometry.size.width * 0.04)
                                    Spacer()
                                    
                                    ZStack(alignment: .topLeading){
                                        RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                        
                                        VStack(alignment: .leading){
                                            Spacer()
                                            HStack{
                                                Text("Temperature Zones").font(.system(size: 16))
                                                Spacer()
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 8).fill(Color.abuContainer).stroke(Color.green, lineWidth: 1)
                                                    HStack{
                                                        Text("+12% Efficiency").font(.system(size: 12)).foregroundStyle(Color.green)
                                                    }
                                                }.frame(width: 112, height: 22)
                                            }.padding(.horizontal,geometry.size.width * 0.04)
                                            Spacer()
                                            HStack{
                                                Text("Automated features saved an estimated 8 minutes of manual operation time today.").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                            }.padding(.horizontal,geometry.size.width * 0.04)
                                            Spacer()
                                        }.padding(.vertical,8)
                                        
                                    }.padding(.horizontal,16).padding(.top,8).frame(height: 142)
    //
                                    Spacer()
                                    
                                }.padding(.vertical, geometry.size.width * 0.04)
                                
                            }.frame(height: geometry.size.height * 0.4).padding(.top,geometry.size.height * 0.15)
                            
                            Spacer()
                            
                            
                            Spacer()
                            
                        }.padding(.top,geometry.size.height * 0.1)
                    } else{
                        HStack(alignment: .center){
                            Spacer()
                            VStack(alignment: .leading){
                                Spacer()
//                              CircularProgressViewStyle()
                                ProgressView(statusMessage)
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    
                }
            }.onAppear(perform: loadData)
        }
    }
}

#Preview {
    OverviewACT()
}
