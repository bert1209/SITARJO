//
//  AnalyticsACT.swift
//  SITARJO
//
//  Created by prk on 10/10/25.
//

import SwiftUI

struct AnalyticsACT: View {
    
    @State var progress1 = 94.0
    @State var progress2 = 99.2
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top){
                Color.abuKecil
                ScrollView{
                    VStack(alignment: .leading){
                        Spacer()
                        ZStack(alignment: .topLeading){
                            RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 1).fill(Color.white)
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "calendar").foregroundStyle(Color.purple)
                                    Text("Weekly Performance").font(.system(size: 20))
                                }.padding(.top,16)
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        VStack(alignment: .leading){
                                            Spacer()
                                            HStack{
                                                Text("Mon").font(.system(size: 16))
                                                Spacer()
                                                Text("8 ops").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("92%").font(.system(size: 16)).foregroundStyle(Color.black)
                                            }
                                            Spacer()
                                            ZStack(alignment: .leading){
                                                Rectangle()
                                                    .fill(Color.biruProgress.opacity(0.2))
                                                    
                                                
                                                Rectangle()
                                                    .fill(Color.biruProgress)
                                                    .frame(width: geometry.size.width * progress1/100 * 0.96,height: 10)
                                            }.frame(maxWidth: .infinity)
                                            Spacer()
                                            HStack{
                                                Text("Tue").font(.system(size: 16))
                                                Spacer()
                                                Text("8 ops").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("92%").font(.system(size: 16)).foregroundStyle(Color.black)
                                            }
                                            Spacer()
                                            ZStack(alignment: .leading){
                                                Rectangle()
                                                    .fill(Color.biruProgress.opacity(0.2))
                                                    
                                                
                                                Rectangle()
                                                    .fill(Color.biruProgress)
                                                    .frame(width: geometry.size.width * progress1/100 * 0.96  ,height: 10)
                                            }.frame(maxWidth: .infinity)
                                            Spacer()
                                            HStack{
                                                Text("Wed").font(.system(size: 16))
                                                Spacer()
                                                Text("8 ops").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("92%").font(.system(size: 16)).foregroundStyle(Color.black)
                                            }
                                            Spacer()
                                            ZStack(alignment: .leading){
                                                Rectangle()
                                                    .fill(Color.biruProgress.opacity(0.2))
                                                    
                                                
                                                Rectangle()
                                                    .fill(Color.biruProgress)
                                                    .frame(width: geometry.size.width * progress1/100 * 0.96  ,height: 10)
                                            }.frame(maxWidth: .infinity)
                                            Spacer()
                                            HStack{
                                                Text("Thu").font(.system(size: 16))
                                                Spacer()
                                                Text("8 ops").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("92%").font(.system(size: 16)).foregroundStyle(Color.black)
                                            }
                                            Spacer()
                                            ZStack(alignment: .leading){
                                                Rectangle()
                                                    .fill(Color.biruProgress.opacity(0.2))
                                                    
                                                
                                                Rectangle()
                                                    .fill(Color.biruProgress)
                                                    .frame(width: geometry.size.width * progress1/100 * 0.96  ,height: 10)
                                            }.frame(maxWidth: .infinity)
                                            Spacer()
                                            HStack{
                                                Text("Fri").font(.system(size: 16))
                                                Spacer()
                                                Text("8 ops").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("92%").font(.system(size: 16)).foregroundStyle(Color.black)
                                            }
                                            Spacer()
                                            ZStack(alignment: .leading){
                                                Rectangle()
                                                    .fill(Color.biruProgress.opacity(0.2))
                                                    
                                                
                                                Rectangle()
                                                    .fill(Color.biruProgress)
                                                    .frame(width: geometry.size.width * progress1/100 * 0.96  ,height: 10)
                                            }.frame(maxWidth: .infinity)
                                            Spacer()
                                            HStack{
                                                Text("Sat").font(.system(size: 16))
                                                Spacer()
                                                Text("8 ops").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("92%").font(.system(size: 16)).foregroundStyle(Color.black)
                                            }
                                            Spacer()
                                            ZStack(alignment: .leading){
                                                Rectangle()
                                                    .fill(Color.biruProgress.opacity(0.2))
                                                    
                                                
                                                Rectangle()
                                                    .fill(Color.biruProgress)
                                                    .frame(width: geometry.size.width * progress1/100 * 0.96  ,height: 10)
                                            }.frame(maxWidth: .infinity)
                                            Spacer()
                                            HStack{
                                                Text("Sun").font(.system(size: 16))
                                                Spacer()
                                                Text("8 ops").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("92%").font(.system(size: 16)).foregroundStyle(Color.black)
                                            }
                                            Spacer()
                                            ZStack(alignment: .leading){
                                                Rectangle()
                                                    .fill(Color.biruProgress.opacity(0.2))
                                                    
                                                
                                                Rectangle()
                                                    .fill(Color.biruProgress)
                                                    .frame(width: geometry.size.width * progress1/100 * 0.96  ,height: 10)
                                            }.frame(maxWidth: .infinity)
                                            Spacer()
                                            
                                        }
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                    
                                   
                                
                            }.padding(.horizontal, geometry.size.width * 0.04)
                            
                        }.frame(height: geometry.size.height * 0.25)
                        
                        Spacer()
                        
                        ZStack(alignment: .topLeading){
                            RoundedRectangle(cornerRadius: 10).stroke(Color.stroke, lineWidth: 1).fill(Color.white)
                            VStack(alignment: .leading){
                                Spacer()
                                HStack{
                                    Image(systemName: "chart.bar.xaxis").foregroundStyle(Color.blue)
                                    Text("Today's Summary").font(.system(size: 16))
                                }.padding(.horizontal,16).padding(.top,16)
                                Spacer()
                                
                                HStack{
                                    
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        VStack(alignment: .leading){
                                            Spacer()
                                            HStack{Image("sun")
                                                Text("Morning Peak").font(.system(size: 14))
                                            }
                                            Spacer()
                                            Text("7:00 - 9:00 AM").font(.system(size: 16)).foregroundStyle(Color.black)
                                            Spacer()
                                            Text("18 operations (38%)").font(.system(size: 12)).foregroundStyle(Color.abuTulisan)
                                        }
                                       
                                    }.frame(width: geometry.size.width * 0.4)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        VStack(alignment: .leading){
                                            Spacer()
                                            HStack{Image("night")
                                                Text("Evening Peak").font(.system(size: 14))
                                            }
                                            Spacer()
                                            Text("5:00 - 7:00 PM").font(.system(size: 16)).foregroundStyle(Color.black)
                                            Spacer()
                                            Text("15 operations (32%)").font(.system(size: 12)).foregroundStyle(Color.abuTulisan)
                                        }
                                    }.frame(width: geometry.size.width * 0.4)
                                    Spacer()
                                }.padding()
                                Spacer()
                                
                                ZStack(alignment: .topLeading){
                                    RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                    
                                    VStack(alignment: .leading){
                                        Spacer()
                                        HStack{
                                            Text("Usage Insight").font(.system(size: 16))
                                        }.padding(.horizontal,geometry.size.width * 0.04)
                                        Spacer()
                                        HStack{
                                            Text("Analysis shows optimal drying time is between 10 AM - 4 PM based on weather patterns.").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                        }.padding(.horizontal,geometry.size.width * 0.04)
                                        Spacer()
                                    }.padding(.vertical,8)
                                    
                                }.padding(.horizontal,16).padding(.vertical,geometry.size.width * 0.02).frame(height: geometry.size.height * 0.2)
                                
                                Spacer()
                            }
                            Spacer()
                            
                        }.frame(height: geometry.size.height * 0.35).padding(.top, geometry.size.height * 0.3)
                        
                        Spacer()
                        
                    }.padding(.vertical,geometry.size.height * 0.2)
                }
            }
        }
    }
}

#Preview {
    AnalyticsACT()
}
