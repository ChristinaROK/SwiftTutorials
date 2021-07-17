//
//  ListViewModel.swift
//  todoList
//
//  Created by ssj on 2021/07/17.
//

import Foundation

class ListViewModel {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first titel", isCompleted: false),
            ItemModel(title: "This is the second", isCompleted: true),
            ItemModel(title: "Third", isCompleted: false)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deletItem(indexSet : IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
}

