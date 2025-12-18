//
//  Note.swift
//  SITARJO
//
//  Created by prk on 29/11/25.
//


import Foundation

struct NotesData: Identifiable, Codable {
    let id: UUID
    let NotesTitle: String
    let NotesContent: String
    let created_at: Date
}
