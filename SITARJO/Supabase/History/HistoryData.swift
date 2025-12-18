//
//  HistoryData.swift
//  SITARJO
//
//  Created by prk on 12/6/25.
//

import Foundation

struct HistoryData: Identifiable, Codable {
    let id: Int
    let total_operations_today: Int
    let last_update: String
    let last_auto_action_reason: String
    let status : String
}
