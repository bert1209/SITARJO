//
//  SettingsPage.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        GeometryReader { geometry in
      
                ScrollView (){
                    VStack (alignment: .leading){
                        Text("Information").font(.system(size: 24))
                        Text("Smart clothesline system")
                        
                        ZStack(alignment: .topLeading){
                            RoundedRectangle(cornerRadius: 14).stroke(Color.stroke, lineWidth: 1.11).fill(Color.white)
                            
                            VStack(alignment: .leading){
                                HStack{
                                    Image(systemName: "info.circle").foregroundStyle(Color.blue)
                                    Text("Application Info")
                                    
                                }.padding(EdgeInsets(top: 25, leading: 16, bottom: 16, trailing: 34))
                               
                                
                                ZStack(alignment: .leading){
                                    RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                    HStack(){
                                        Image("Logo1")
                                        
                                        VStack (alignment: .leading){
                                            Text("SITARJO Pro")
                                            Text("Smart Clothlines System").font(.system(size: 16)).foregroundStyle(Color.abuTulisan)
                                        }
                                    }.padding(.horizontal,geometry.size.width * 0.04)
                                           
                                    
                                }.padding(.horizontal,geometry.size.width * 0.04).padding(.top,10).frame(height: geometry.size.height * 0.1)
                                
                                VStack(alignment: .leading){
                    
                                    
                                    Spacer()
                                    
                                    HStack{
                                        VStack(alignment: .leading) {
                                            VStack(alignment: .leading){
                                                Text("Model:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("SITARJO Pro").font(.system(size: 16))
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("Firmware:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("v0.1.1").font(.system(size: 16))
                                            }
                                            Spacer()
            
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading) {
                                            VStack(alignment: .leading){
                                                Text("Serial:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("STJ2024-078").font(.system(size: 16))
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("WiFi:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 8).fill(Color.white).stroke(Color.green, lineWidth: 1)
                                                    HStack{
                                                        
                                                        Text("Connected").font(.system(size: 12)).foregroundStyle(Color.green)
                                                    }
                                                }.frame(width: 73, height: 8)
                                            }
                                            Spacer()
        
                                            
                                        }
                                        Spacer()
                                    }.padding()
                                }.padding(.horizontal,geometry.size.width * 0.04 )
                                
                            }
                            
                        }.frame(height: geometry.size.height * 0.4)
                        
                    }.padding(.horizontal, geometry.size.width * 0.04)
                }.background(Color.abuKecil).padding(.top, geometry.size.height * 0.01)
        }.background(Color.abuKecil)
    }
        
    
}

#Preview {
    SettingsPage()
}
