//
//  ListRowView.swift
//  todoList
//
//  Created by ssj on 2021/07/17.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer() // push every item to the left
        }
        .font(.title2)
        .padding(.vertical, 10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item", isCompleted: true)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
