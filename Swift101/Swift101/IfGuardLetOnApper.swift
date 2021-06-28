//
//  ContentView.swift
//  Swift101
//
//  Created by ssj on 2021/06/28.
//

import SwiftUI

struct IfGuardLetOnApper: View {
    
    @State var currentUserID: String? = "sjshin"
    @State var displayText: String? = nil
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing safe coding!")
                
                // displayText variable의 state가 변하면 즉시 view가 실행됨
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                
                // isLoading variable의 state가 변하면 즉시 view가 실행됨
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
                
            }
            .navigationTitle("Safe Coding")
            .onAppear(perform: {
                loadData2()
            })
            
            
            
        }
    }
    
    //    func loadData() {
    //
    //        if let userID = currentUserID {
    //            isLoading = true
    //            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    //                displayText = "This is the new data! User ID is : \(userID)"
    //                isLoading = false
    //            }
    //        } else {
    //            displayText = "Error. No User ID!"
    //        }
    //    }
    
    func loadData2() {
        
        guard let userID = currentUserID else {
            displayText = "Error. No User ID!"
            return
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data! User ID is : \(userID)"
            isLoading = false
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IfGuardLetOnApper()
    }
}
