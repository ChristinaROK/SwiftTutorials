//
//  ListViewModel.swift
//  todoList
//
//  Created by ssj on 2021/07/17.
//

import Foundation

/*
 CRUD function
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    
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
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateitem(item: ItemModel) {
        
//        if let index = items.firstIndex { (existingItem) -> Bool in
//            return existingItem.id == item.id
//        } {
//            // run this code
//
//        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}) { // $0 == looping items
            items[index] = item.updateCompletetion()
        }
    }
}

