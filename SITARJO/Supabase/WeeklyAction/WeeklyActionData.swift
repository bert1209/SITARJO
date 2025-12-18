//
//  WeeklyActionData.swift
//  SITARJO
//
//  Created by prk on 02/12/25.
//

import Foundation

struct WeeklyActionData: Codable, Identifiable {
    let id: UUID
    let Monday : Double
    let Tuesday : Double
    let Wednesday : Double
    let Thursday : Double
    let Friday : Double
    let Saturday : Double
    let Sunday : Double
}

