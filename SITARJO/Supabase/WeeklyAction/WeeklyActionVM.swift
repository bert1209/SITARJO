//
//  WeeklyActionVM.swift
//  SITARJO
//
//  Created by prk on 02/12/25.
//

import Foundation

class WeeklyActionVM : ObservableObject{
    @Published var WeeklyAction: [WeeklyActionData] = []
    
    private let repo = WeeklyActionManager()

    func loadAction() async {
        do {
            WeeklyAction = try await repo.getAction()
        } catch {
            print("Error loading action: \(error)")
        }
    }
}
