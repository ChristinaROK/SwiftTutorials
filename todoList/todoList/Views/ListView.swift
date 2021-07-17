//
//  ListView.swift
//  todoList
//
//  Created by ssj on 2021/07/17.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first titel", isCompleted: false),
        ItemModel(title: "This is the second", isCompleted: true),
        ItemModel(title: "Third", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: deletItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(),
                            trailing:
                            NavigationLink("add", destination: AddView())
                            )
        
    }
    
    func deletItem(indexSet : IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


