//
//  ListEditMode.swift
//  Swift101
//
//  Created by ssj on 2021/07/04.
//

import SwiftUI

struct ListEditMode: View {
    
    @State private var items: [Item] = []
    private static var count = 0
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) {item in
                    Text(item.title)
                        .onLongPressGesture(minimumDuration: 0.2) {
                            editMode = EditMode.active
                        }
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
            }
            .navigationBarTitle("List")
//            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .navigationBarItems(trailing: addButton)
            .environment(\.editMode, $editMode)
        // TODO: tap empty area -> editMode == inactive
        
        }
    }
    
    private var addButton: some View {
        
        switch editMode {
        // append to list only when edit mode is inactive
            case .inactive:
                return AnyView(Button(action: onAdd, label: {
                    Image(systemName: "plus")
                }))
            default:
                return AnyView(EmptyView())
        }
    }
    
    func onAdd() {
        items.append(Item(title: "Item #\(Self.count)"))
        Self.count += 1
        
    }
    
    
    private func onDelete(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
    
}

struct ListEditMode_Previews: PreviewProvider {
    static var previews: some View {
        ListEditMode()
    }
}

struct Item: Identifiable {
    let id = UUID() // hashable
    let title: String
}


