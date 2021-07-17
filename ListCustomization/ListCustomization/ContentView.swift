//
//  ContentView.swift
//  ListCustomization
//
//  Created by ssj on 2021/07/10.
//

import SwiftUI

struct ContentView: View {
    
    let fruits = [
        Fruit(name: "Apple"),
        Fruit(name: "Mango"),
        Fruit(name: "Orange")
    ]
    
    @State private var selectedFruit: Fruit?
    
    var body: some View {
        List {
            ForEach(fruits) { fruit in
                HStack {
                    Text(fruit.name)
                    Spacer()
                }
                .foregroundColor(Color.white)
                .padding()
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .listRowBackground(selectedFruit == fruit ? Color.blue.opacity(0.5)
                                    .clipShape(RoundedRectangle(cornerRadius: 10)) : Color(UIColor.systemGroupedBackground).clipShape(RoundedRectangle(cornerRadius: 10)))
                .onTapGesture {
                    selectedFruit = fruit
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
