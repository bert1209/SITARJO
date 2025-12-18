//
//  NotesManager.swift
//  SITARJO
//
//  Created by prk on 29/11/25.
//

import Foundation

class NotesManager {
    let client = SupabaseManager.shared.client

    func getNotes() async throws -> [NotesData] {
        try await client
            .from("SitarjoNotes")
            .select()
            .order("created_at", ascending: false)
            .execute()
            .value as [NotesData]
    }


    
    func insertNote(title: String, content: String) async throws {
        try await client
            .from("SitarjoNotes")
            .insert([
                "NotesTitle": title,
                "NotesContent": content
            ])
            .execute()
    }

    func updateNote(id: UUID, title: String, content: String) async throws {
        try await client
            .from("SitarjoNotes")
            .update([
                "NotesTitle": title,
                "NotesContent": content
            ])
            .eq("id", value: id)
            .execute()
    }
    
    func deleteNote(id: UUID) async throws {
        try await client
            .from("SitarjoNotes")
            .delete()
            .eq("id", value: id)
            .execute()
    }

}
