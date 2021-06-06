//
//  ContentView.swift
//  NavigationBarButton
//
//  Created by ssj on 2021/06/06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("christina")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(100)
                    .padding()
                
                Form {
                    Section(header: Text("Personal Info")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        TextField("Company", text: $company)
                        
                    }
                }
            }
            .navigationTitle("Profile")
            .toolbar { // view builder
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        print("Save tapped")
                    } label: {
                        Label("Save", systemImage: "square.and.arrow.down")
                    }
                    
                    Button {
                        print("Save tapped")
                    } label: {
                        Label("Save", systemImage: "square.and.arrow.down")
                    }
                }
            }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
