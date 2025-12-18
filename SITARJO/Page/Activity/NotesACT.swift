//
//  NotesACT.swift
//  SITARJO
//
//  Created by prk on 29/11/25.
//

import SwiftUI

struct NotesACT: View {
    @StateObject var vm = NotesViewModel()

    @State private var showAddPopup = false
    @State private var newTitle = ""
    @State private var newContent = ""
    @State private var showUpdatePopup = false
    @State private var selectedNote: NotesData?
    @State private var editTitle = ""
    @State private var editContent = ""

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(vm.notes) { note in

                            NoteCards(note: note)
                                .onTapGesture {
                                    selectedNote = note
                                    editTitle = note.NotesTitle
                                    editContent = note.NotesContent
                                    showUpdatePopup = true
                                }
                                .contextMenu {
                                    Button("Edit") {
                                        selectedNote = note
                                        editTitle = note.NotesTitle
                                        editContent = note.NotesContent
                                        showUpdatePopup = true
                                    }

                                    Button(role: .destructive) {
                                        Task {
                                            await vm.deleteNote(id: note.id)
                                            await vm.loadNotes()
                                        }
                                    } label: {
                                        Text("Delete")
                                    }
                                }
                        }
                    }
                    .padding()
                }.background(Color.abuKecil)
                Button (
                    action: {
                        showAddPopup = true
                    }
                ) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(Color.blue)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }.padding()
            }
            .task {
                await vm.loadNotes()
            }
        }
        .background(Color(UIColor.systemGray6))

        // Popup Add
        .overlay {
            if showAddPopup {
                addPopup
            }
        }

        // Popup Update
        .overlay {
            if showUpdatePopup {
                updatePopup
            }
        }
    }
}

extension NotesACT {
    var addPopup: some View {
        VStack(spacing: 12) {
            Text("New Note").font(.headline)

            TextField("Title", text: $newTitle)
                .textFieldStyle(.roundedBorder)

            TextField("Content", text: $newContent)
                .textFieldStyle(.roundedBorder)

            HStack {
                Button("Cancel") {
                    showAddPopup = false
                }
                .foregroundColor(.red)

                Spacer()

                Button("Save") {
                    Task {
                        await vm.insertNote(title: newTitle, content: newContent)
                        newTitle = ""
                        newContent = ""
                        showAddPopup = false
                    }
                }
                .bold()
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 12)
        .padding()
        .transition(.scale)
    }
}


extension NotesACT {
    var updatePopup: some View {
        VStack(spacing: 12) {
            Text("Edit Note").font(.headline)

            TextField("Title", text: $editTitle)
                .textFieldStyle(.roundedBorder)

            TextField("Content", text: $editContent)
                .textFieldStyle(.roundedBorder)

            HStack {
                Button("Cancel") {
                    showUpdatePopup = false
                }
                .foregroundColor(.red)

                Spacer()

                Button("Update") {
                    Task {
                        if let note = selectedNote {
                            await vm.updateNote(id: note.id, title: editTitle, content: editContent)
                            await vm.loadNotes()
                        }
                        showUpdatePopup = false
                    }
                }
                .bold()
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 12)
        .padding()
        .transition(.scale)
    }
}

struct NoteCards: View {
    let note: NotesData

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(note.NotesTitle)
                .font(.headline)
                .foregroundColor(.black)

            Text(note.NotesContent)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    NotesACT()
}
