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
    let status: String
    let mode: String
    let light_threshold: Int
    let last_auto_action_reason: String
    let raw_suhu: String
    let raw_kelembaban: String
    let raw_lux: String
    let is_motor_running: Bool
    let total_operations_today: Int
    let manual_actions_today: Int
    let auto_actions_today: Int
    let rain_triggers_today: Int
    let dark_triggers_today: Int
    let timer_triggers_today: Int
    let last_update: String
    let suhu_minimal: Int
    let cold_triggers_today: Int
    
    // Computed properties untuk format yang lebih user-friendly
    var temperature: String {
        return String(format: "%.1f°C", raw_suhu)
    }
    
    var humidity: String {
        return String(format: "%.1f%%", raw_kelembaban)
    }
    
    var lightLevel: String {
        return String(format: "%.1f lux", raw_lux)
    }
    
    var motorStatus: String {
        return is_motor_running ? "Running" : "Stopped"
    }
    
    var formattedLastUpdate: String {
        // Format timestamp menjadi readable format
        // Contoh: "12:17" atau format lain sesuai kebutuhan
        return last_update
    }
    
    var efficiency: Double {
        return Double(auto_actions_today / total_operations_today * 100)
    }
}

// MARK: - Response untuk debugging
extension ESPData {
    func printDebugInfo() {
        print("=== ESP32 Data ===")
        print("Online: \(online)")
        print("Sensors Status: \(sensors_status)")
        print("Device Status: \(status)")
        print("Mode: \(mode)")
        print("Temperature: \(temperature)")
        print("Humidity: \(humidity)")
        print("Light Level: \(lightLevel)")
        print("Motor: \(motorStatus)")
        print("Total Operations Today: \(total_operations_today)")
        print("Manual Actions: \(manual_actions_today)")
        print("Auto Actions: \(auto_actions_today)")
        print("Rain Triggers: \(rain_triggers_today)")
        print("Dark Triggers: \(dark_triggers_today)")
        print("Timer Triggers: \(timer_triggers_today)")
        print("Last Update: \(last_update)")
        print("==================")
    }
}
