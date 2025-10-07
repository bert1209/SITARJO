//
//  ContentView.swift
//  SITARJO
//
//  Created by prk on 07/10/25.
//

import SwiftUI

struct ControlPage: View {
    
    @State var progress = 0.0
    @State private var isOn: Bool = false
    
    var body: some View {
        ZStack{
            Color.abuKecil
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack (alignment: .leading){
                    
                    HStack{
                        Image("Logo").padding(5)
                        VStack(alignment: .leading){
                            Text("Sitarjo Controller").font(.system(size: 24))
                            Text("Advanced clothesline operation center").font(.system(size: 16)).foregroundStyle(Color.gray)
                        }
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 0))
                    
                    ZStack(alignment: .topLeading){
                        RoundedRectangle(cornerRadius: 14).stroke(Color.stroke, lineWidth: 1.11).fill(Color.white)
                        VStack(alignment: .leading){
                            HStack{
                                Image("petirTarjo")
                                Text("Basic Control")
                            }.padding(EdgeInsets(top: 25, leading: 34, bottom: 16, trailing: 0))
                            
                            HStack{
                                Text("Current Position").font(.system(size: 14)).foregroundStyle(Color.gray)
                                Spacer()
                                Text("0%").font(.system(size: 14)).foregroundStyle(Color.gray)
                            }.padding(EdgeInsets(top: 0, leading: 34, bottom: 0, trailing: 34))
                            
                            
                            ZStack(alignment: .leading){
                                Rectangle()
                                    .fill(Color.biruProgress.opacity(0.2))
                                    .frame(height: 12)
                                
                                Rectangle()
                                    .fill(Color.biruProgress)
                                    .frame(width: progress ,height: 10)
                            }.padding(.horizontal,34)
                            
                            HStack{
                                Button(action: {
                                    
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 8).frame(height: 80)
                                            VStack{
                                                Image(systemName: "play").foregroundStyle(Color.white).font(.system(size: 20))
                                                Text("Extend").foregroundStyle(Color.white).font(.system(size: 12)).padding(.top,1)
                                            }
                                        }
                                        
                                    }
                                )
                                Button(action: {
                                    
                                    }, label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 8).frame(height: 80)
                                            VStack{
                                                Image(systemName: "arrow.trianglehead.counterclockwise").foregroundStyle(Color.white)
                                                Text("Retract").foregroundStyle(Color.white).font(.system(size: 12)).padding(.top,1)
                                            }
                                        }
                                        
                                    }
                                )
                            }.padding(.horizontal,34).padding(.top,16)
                            
                            ZStack(alignment: .topLeading){
                                RoundedRectangle(cornerRadius: 10).fill(Color.abuContainer.opacity(0.5))
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("System Status").font(.system(size: 16))
                                        Spacer()
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 8).fill(Color.abuContainer).stroke(Color.green, lineWidth: 1)
                                            HStack{
                                                Image("petirIjoTarjo")

                                                Text("Online").font(.system(size: 12)).foregroundStyle(Color.green)
                                            }
                                        }.frame(width: 73, height: 22)
                                    }.padding(.horizontal,16).padding(.top,16)
                                    
                                    HStack{
                                        VStack(alignment: .leading) {
                                            VStack(alignment: .leading){
                                                Text("Censors:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("All Active").font(.system(size: 16))
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("Energy Usage:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("Normal").font(.system(size: 16))
                                            }
                                            Spacer()
                                            VStack(alignment: .leading){
                                                Text("Status:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("Fully Retracted").font(.system(size: 16))
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("Mode:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("Manual").font(.system(size: 16))
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .leading) {
                                            VStack(alignment: .leading){
                                                Text("Auto Actions:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("6 Today").font(.system(size: 16))
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("Last Update:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("2 Min Ago").font(.system(size: 16))
                                            }
                                            Spacer()
                                            VStack(alignment: .leading){
                                                Text("Speed:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("Normal").font(.system(size: 16))
                                            }
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Text("Timer:").font(.system(size: 14)).foregroundStyle(Color.abuTulisan)
                                                Text("Off").font(.system(size: 16))
                                            }
            
                                        }
                                        Spacer()
                                    }.padding()
                                }
                                
                            }.padding(.horizontal,34).padding(.top,96).frame(height: 172)
                        }
                        
                    }.frame(height: 525)
                    
                    ZStack(alignment: .topLeading){
                        RoundedRectangle(cornerRadius: 14).stroke(Color.stroke, lineWidth: 1.11).fill(Color.white)
                        VStack(alignment: .leading){
                            HStack{
                                Image("setting")
                                Text("Quick Setting")
                            }.padding(EdgeInsets(top: 25, leading: 34, bottom: 16, trailing: 0))
                            
                            Text("Enviromental Protection").padding(.leading,34)
                            
                            HStack{
                                Image("wind").padding(5).frame(width: 50, height: 50)
                                VStack(alignment: .leading){
                                    Text("Sitarjo Controller").font(.system(size: 14))
                                    Text("Advanced clothesline operation center").font(.system(size: 12)).foregroundStyle(Color.gray)
                                }
                                Toggle(isOn: $isOn){
                                    
                                }.padding().scaleEffect(0.9)
                            }.padding(.leading,34)
                            HStack{
                                Image("wind").padding(5).frame(width: 50, height: 50)
                                VStack(alignment: .leading){
                                    Text("Sitarjo Controller").font(.system(size: 14))
                                    Text("Advanced clothesline operation center").font(.system(size: 12)).foregroundStyle(Color.gray)
                                }
                                Toggle(isOn: $isOn){
                                    
                                }.padding().scaleEffect(0.9)
                            }.padding(.leading,34)
                            HStack{
                                Image("wind").padding(5).frame(width: 50, height: 50)
                                VStack(alignment: .leading){
                                    Text("Sitarjo Controller").font(.system(size: 14))
                                    Text("Advanced clothesline operation center").font(.system(size: 12)).foregroundStyle(Color.gray)
                                }
                                Toggle(isOn: $isOn){
                                    
                                }.padding().scaleEffect(0.9)
                            }.padding(.leading,34)
                            HStack{
                                Image("wind").padding(5).frame(width: 50, height: 50)
                                VStack(alignment: .leading){
                                    Text("Sitarjo Controller").font(.system(size: 14))
                                    Text("Advanced clothesline operation center").font(.system(size: 12)).foregroundStyle(Color.gray)
                                }
                                Toggle(isOn: $isOn){
                                    
                                }.padding().scaleEffect(0.9)
                            }.padding(.leading,34)
                            HStack{
                                Image("wind").padding(5).frame(width: 50, height: 50)
                                VStack(alignment: .leading){
                                    Text("Sitarjo Controller").font(.system(size: 14))
                                    Text("Advanced clothesline operation center").font(.system(size: 12)).foregroundStyle(Color.gray)
                                }
                                Toggle(isOn: $isOn){
                                    
                                }.padding().scaleEffect(0.9)
                            }.padding(.leading,34)
                        }
                        
                    }.frame(height: 525)
                    
                }.padding(.horizontal,16).padding(.vertical,14)
            }
        }
    }
}

#Preview {
    ControlPage()
}
