//
//  HistoryManager.swift
//  SITARJO
//
//  Created by prk on 12/6/25.
//

import Foundation

class HistoryManager {
    
    let client = SupabaseManager.shared.client

    func getHistory() async throws -> [HistoryData] {
        try await client
            .from("daily_logs")
            .select()
            .order("id", ascending: false)
            .execute()
            .value as [HistoryData]
    }
    
    func deleteHistory() async throws {
        try await client
            .from("daily_logs")
            .delete()
            .gt("id",value: 0)
            .execute()
    }
    
}
