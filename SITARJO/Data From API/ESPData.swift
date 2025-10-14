//
//  ESPData.swift
//  SITARJO
//
//  Created by prk on 14/10/25.
//

import Foundation


struct ESPData: Codable {
    let online: Bool
    let sensors_status: String
    let auto_actions_today: Int
    let energy_usage: String
    let last_update: String
    let status: String
    let speed: String
    let mode: String
    let timer_status: String
    let raw_suhu: String
    let raw_kelembaban: String
    let raw_lux: String
}
