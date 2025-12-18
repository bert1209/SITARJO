//
//  NotesViewModel.swift
//  SITARJO
//
//  Created by prk on 29/11/25.
//


import SwiftUI

@MainActor
class NotesViewModel: ObservableObject {
    @Published var notes: [NotesData] = []

    private let repo = NotesManager()

    func loadNotes() async {
        do {
            notes = try await repo.getNotes()
        } catch {
            print("Error loading notes: \(error)")
        }
    }

    func insertNote(title: String, content: String) async {
        do {
            try await repo.insertNote(title: title, content: content)
            await loadNotes()
        } catch {
            print("Error adding note: \(error)")
        }
    }
    
    func updateNote(id : UUID, title: String, content: String) async {
        do {
            try await repo.updateNote(id: id, title: title, content: content)
            await loadNotes()
        } catch {
            print("Error updating note: \(error)")
        }
    }

    func deleteNote(id: UUID) async {
        do {
            try await repo.deleteNote(id: id)
            await loadNotes()
        } catch {
            print("Error deleting note: \(error)")
        }
    }
}
