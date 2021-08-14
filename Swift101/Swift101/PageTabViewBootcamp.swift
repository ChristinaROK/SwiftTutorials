//
//  PageTabViewBootcamp.swift
//  Swift101
//
//  Created by ssj on 2021/08/15.
//

import SwiftUI

struct PageTabViewBootcamp: View {
    
    @State private var currentIndex = 1
    private let colors: [Color] = [.red, .blue, .green, .yellow]
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<colors.count, id: \.self) { index in
                ZStack{
                colors[index].tag(index)
                Text("\(currentIndex.description)")
                }
            }
    }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
}
}

struct PageTabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PageTabViewBootcamp()
    }
}
