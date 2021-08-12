//
//  tabviewBootcamp.swift
//  Swift101
//
//  Created by ssj on 2021/08/08.
//

import SwiftUI

struct tabviewBootcamp: View {
    var body: some View {
        
        TabView {
            Text("1st tab view")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("first")
                }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Last")
                }
                
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
}

struct tabviewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        tabviewBootcamp()
    }
}
