//
//  HistoryACT.swift
//  SITARJO
//
//  Created by prk on 10/10/25.
//

import SwiftUI

struct HistoryACT: View {
    
    @StateObject var vm = HistoryVM()
    @State private var HistoryPopUp = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack (alignment: .topLeading){
                Color.abuKecil
               
                    VStack{
                        HStack{
                            Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                            Text("Recent Activity")
                        }
                    }.padding(.vertical,geometry.size.height * 0.05)
                NavigationView {
                    ZStack(alignment: .bottomTrailing) {
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(vm.History) { History in

                                    HistoryCards(history: History)
                                        
                                }
                            }
                            .padding()
                        }.background(Color.abuKecil)
                        Button (
                            action: {
                                HistoryPopUp = true
                            }
                        ) {
                            Image(systemName: "trash")
                                .font(.system(size: 24))
                                .foregroundColor(Color.red)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }.padding()
                    }
                    .task {
                        await vm.loadHistory()
                    }
                }
                .background(Color(UIColor.systemGray6))
                .overlay {
                    if HistoryPopUp {
                        deletePopup
                    }
                }
                
            }
        }
    }
}

extension HistoryACT {
    var deletePopup: some View {
        VStack(spacing: 12) {
            Text("Are you sure?").font(.headline)

    
            HStack {
                Spacer()
                Button("Cancel") {
                    HistoryPopUp = false
                }
                .foregroundColor(.red)

                Spacer()

                Button("Delete") {
                    Task {
                        await vm.deleteHistory()
                    HistoryPopUp = false
                    }
                }
                .bold()
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 12)
        .padding()
        .transition(.scale)
    }
}

struct HistoryCards: View {
    let history: HistoryData

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(history.status)
                .font(.headline)
                .foregroundColor(.black)
            HStack{
                Text(history.last_auto_action_reason)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(history.last_update)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    HistoryACT()
}
