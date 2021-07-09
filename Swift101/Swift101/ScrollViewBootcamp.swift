//
//  ScrollViewBootcamp.swift
//  Swift101
//
//  Created by ssj on 2021/07/09.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(0..<20) {index in
                                RoundedRectangle(cornerRadius:  25)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150, alignment: .center)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                            
                        }
                    })
                    
                }
            }
        }
    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}
