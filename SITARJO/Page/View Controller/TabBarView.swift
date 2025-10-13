//
//  TabBarView.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            Group{
                ControlPage().tabItem{
                    Label("Control", systemImage: "house")
                }.onAppear(){
                    
                }
                SegmentedView().tabItem{
                    Label("Environment", systemImage: "powermeter")
                }
                ActivityView().tabItem{
                    Label("Activity", systemImage: "waveform.path.ecg")
                }
                SettingsPage().tabItem{
                    Label("Settings", systemImage: "gearshape")
                }
                
            }.toolbarBackground(.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

#Preview {
    TabBarView()
}
