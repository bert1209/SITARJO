//
//  HistoryACT.swift
//  SITARJO
//
//  Created by prk on 10/10/25.
//

import SwiftUI

struct HistoryACT: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .topLeading){
                Color.abuKecil
                ScrollView{
                    VStack{
                        HStack{
                            Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                            Text("Recent Activity")
                        }
                    }.padding(.vertical,geometry.size.height * 0.05)
                }
            }
        }
    }
}

#Preview {
    HistoryACT()
}
