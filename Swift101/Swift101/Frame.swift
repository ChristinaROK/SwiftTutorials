//
//  Frame.swift
//  Swift101
//
//  Created by ssj on 2021/07/08.
//

import SwiftUI

struct Frame: View {
    var body: some View {
        // Stack 순서가 중요함
        Text("Hello, World!")
            .background(Color.green)
            //.frame(width: 300, height: 300, alignment: .leading)
            .frame(maxWidth: .infinity, maxHeight: .infinity,
                   alignment: .top)
            .background(Color.red)
    }
}

struct Frame2: View {
    var body: some View {
        // frame의 alignment는 이전 view의 위치를 의미
        Text("Hello, World!")
            .background(Color.red)
            .frame(height: 100, alignment: .top)
            .background(Color.orange)
            .frame(width: 150)
            .background(Color.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.pink)
            .frame(height: 400)
            .background(Color.green)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.yellow)
        
    }
}

struct Frame_Previews: PreviewProvider {
    static var previews: some View {
        Frame2()
    }
}
