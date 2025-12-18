//
//  WeeklyActionManager.swift
//  SITARJO
//
//  Created by prk on 02/12/25.
//

import Foundation

class WeeklyActionManager {
    
    let client = SupabaseManager.shared.client

    func getAction() async throws -> [WeeklyActionData] {
        try await client
            .from("WeeklyAction")
            .select()
            .eq("id",value:"0eed8dcc-fe2e-4b3c-a696-e946fc3b74b6")
            .execute()
            .value as [WeeklyActionData]
    }
    
}
