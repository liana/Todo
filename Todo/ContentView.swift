//
//  ContentView.swift
//  Todo
//
//  Created by Liana Leahy on 10/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var todos: [String] = [
        "Play guitar",
        "learn Swift",
        "Sleep",
        "find Halloween party",
        "watch TV"
    ]
    
    @State var showingAlert: Bool = false
    @State var newItem = ""
    
    func addNewItem() {
        todos.append(newItem)
        newItem = ""
    }
    
    var body: some View {
        NavigationStack {
            List($todos, id: \.self, editActions: .all) { $todoItem in
                Text(todoItem)
            }.navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showingAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.alert("What you want?", isPresented: $showingAlert) {
            TextField("Add item here", text: $newItem)
            Button {
                addNewItem()
            } label: {
                Text("OK")
            }
        }
    }
}

#Preview {
    ContentView()
}
