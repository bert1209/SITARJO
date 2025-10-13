//
//  ActivityTabBar.swift
//  SITARJO
//
//  Created by prk on 10/10/25.
//

import SwiftUI

struct ActivityView: View {
    @State private var selectedSegment = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading){
                Color.abuKecil
                VStack(alignment: .leading){
                    Text("Activity Center").font(.system(size: 24)).padding(.vertical,1)
                    Text("Comprehensive system analytics and operation history").font(.system(size: 14)).foregroundStyle(Color.abuTulisan).padding(.vertical,1)
                    
                    Picker("Pilih tampilan", selection: $selectedSegment){
                        Text("Overview").tag(0)
                        Text("Analytics").tag(1)
                        Text("History").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical,8)
                    
                    
                    if selectedSegment == 0 {
                        OverviewACT()
                    } else if selectedSegment == 1 {
                        AnalyticsACT()
                    } else if selectedSegment == 2 {
                        HistoryACT()
                    }
                }.padding(.horizontal,16).padding(.top,8).padding(.bottom,0)
            }
        }
    }
}

#Preview {
    ActivityView()
}
