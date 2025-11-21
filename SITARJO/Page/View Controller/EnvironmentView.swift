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
                Text("Environment").font(.system(size: 24)).padding(.vertical,1)
                Text("Temperature control and weather monitoring").font(.system(size: 16)).foregroundStyle(Color.abuTulisan).padding(.vertical,1)
                
                Picker("Pilih tampilan", selection: $selectedSegment){
                    Text("Overview").tag(0)
                    Text("Temperature").tag(1)
                    Text("Weather").tag(2)
                }
                .pickerStyle(.segmented)
                .padding(.vertical,8)

                
                if selectedSegment == 0 {
                    OverviewENV()
                } else if selectedSegment == 1 {
                    TempratureENV()
                } else if selectedSegment == 2 {
                    WeatherENV()
                }
            }.padding(.horizontal,16).padding(.top,8).padding(.bottom,0)
        }
    }
}

#Preview {
    SegmentedView()
}
