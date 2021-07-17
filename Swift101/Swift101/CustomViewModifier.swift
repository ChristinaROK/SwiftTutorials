//
//  temp.swift
//  Swift101
//
//  Created by ssj on 2021/07/16.
//

import SwiftUI

struct EmptyModifier: ViewModifier {
    // view modifier
    
    let isEmpty: Bool
    
    func body(content: Content) -> some View {
        Group {
            if isEmpty {
                EmptyView()
            } else {
                content
            }
        }
    }
}

extension View {
    func isEmpty(_ bool: Bool) -> some View {
        modifier(EmptyModifier(isEmpty: bool))
    }
}

struct CustomViewModifier: View {
    
    @State private var isSubtitleVisible: Bool = false
    
    var body: some View {
        VStack {
            Text("Title")
            Text("Subtitle").isEmpty(isSubtitleVisible)
            Text("Body")
            Spacer()
        }
    }
}


struct temp_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifier()
    }
}
