//
//  ContentView.swift
//  Binding
//
//  Created by ssj on 2021/06/07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingSheet = true
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "scribble.variable")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Button {
                    isShowingSheet = true
                } label: {
                    Label("Say hello", image: "clock.fill")
                }
            }
            .sheet(isPresented: $isShowingSheet, content: {
                ChangeTimeOfDayView()
            }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
