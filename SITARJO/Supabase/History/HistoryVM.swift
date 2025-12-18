//
//  HistoryVM.swift
//  SITARJO
//
//  Created by prk on 12/6/25.
//

import Foundation

class HistoryVM : ObservableObject{
    @Published var History: [HistoryData] = []
    
    private let repo = HistoryManager()

    func loadHistory() async {
        do {
            History = try await repo.getHistory()
        } catch {
            print("Error loading action: \(error)")
        }
    }
    
    func deleteHistory() async {
        do {
            try await repo.deleteHistory()
            await loadHistory()
        } catch {
            print("Error deleting note: \(error)")
        }
    }
}
