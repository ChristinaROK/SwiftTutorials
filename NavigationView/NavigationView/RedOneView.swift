//
//  ContentView.swift
//  NavigationView
//
//  Created by ssj on 2021/06/06.
//

import SwiftUI

struct RedOneView: View {
    var body: some View {
        NavigationView{ // container of array of Views (Stack)
            VStack {
                CircleNumberView(color: .red, number: 1)
//                    .navigationTitle("Red One")
                    .navigationBarTitle("Red One", displayMode: .inline) // old version 
                    .offset(y: -60)
                NavigationLink(
                    destination: BlueTwoView(),
                    label: {
                        Text("Next Screen")
                    })
            }
        }
    }
}

struct BlueTwoView: View {
    var body: some View {
        VStack {
            CircleNumberView(color: .blue, number: 2)
                .navigationTitle("Blue Two")
                .offset(y: -60)
            NavigationLink(
                destination: GreenThreeView(),
                label: {
                    Text("Next Screen")
                })
        }
    }
}

struct GreenThreeView: View {
    var body: some View {
        VStack {
            CircleNumberView(color: .green, number: 3)
                .navigationTitle("Green Three")
                .offset(y: -60)
//            NavigationLink(
//                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
//                label: {
//                    Text("Next Screen")
//                })
        }
    }
}

struct CircleNumberView: View {
    
    var color: Color
    var number: Int
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold, design: .default))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RedOneView()
    }
}
