//
//  SegmentedView.swift
//  SITARJO
//
//  Created by prk on 08/10/25.
//

import SwiftUI

struct SegmentedView: View {
    
    @State private var selectedSegment = 0
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.abuKecil
            VStack(alignment: .leading){
                Text("Environment").font(.system(size: 24))
                Text("Temperature control and weather monitoring").font(.system(size: 16)).foregroundStyle(Color.abuTulisan)
                
                Picker("Pilih tampilan", selection: $selectedSegment){
                    Text("Overview").tag(0)
                    Text("Temprature").tag(1)
                    Text("Weather").tag(2)
                }
                .pickerStyle(.segmented)
                .padding(1)

                
                if selectedSegment == 0 {
                    Overview()
                } else if selectedSegment == 1 {
                    Temprature()
                } else if selectedSegment == 2 {
                    Weather()
                }
            }.padding(.horizontal,16).padding(.top,8).padding(.bottom,0)
        }
    }
}

#Preview {
    SegmentedView()
}
