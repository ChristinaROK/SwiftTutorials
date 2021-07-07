//
//  ListDraggable.swift
//  Swift101
//
//  Created by ssj on 2021/07/06.
//

import SwiftUI

struct ListDraggable: View {
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    @State var recipeSteps = [
        "b", "l", "a", "h"
    ]
    @State var editingList = false
    
    var body: some View {
        List{
            ForEach(0..<recipeSteps.count) { i in
                Text("\(i). \(self.recipeSteps[i])")
                    .lineLimit(nil)
                
            }
            .onMove(perform: move)
            .onLongPressGesture {
                withAnimation {
                    self.editingList = true
                }
            }
        }
        .environment(\.editMode, editingList ? .constant(.active) : .constant(.inactive))
    }
    
    func move(fromOffsets source: IndexSet, toOffsets destination: Int){
        recipeSteps.move(fromOffsets: source, toOffset: destination)
        withAnimation {
            self.editingList = false
        }
    }
}

struct ListDraggable_Previews: PreviewProvider {
    static var previews: some View {
        ListDraggable()
    }
}
