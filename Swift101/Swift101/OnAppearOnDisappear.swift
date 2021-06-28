//
//  OnAppearOnDisappear.swift
//  Swift101
//
//  Created by ssj on 2021/06/29.
//

import SwiftUI

struct OnAppearOnDisappear: View {
    
    @State var myText: String = "Start text."
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius:  10)
                            .frame(width: 300, height: 200, alignment: .center)
                            .padding()
                            .onAppear(perform: {
                                count += 1
                            })
                    }
                
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text!"
                }
            })
            .onDisappear(perform: {
               myText = "Ending text."
                }
            )
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct OnAppearOnDisappear_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearOnDisappear()
    }
}
