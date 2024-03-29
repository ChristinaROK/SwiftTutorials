//
//  ContentView.swift
//  Form
//
//  Created by ssj on 2021/06/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthday = Date()
    @State private var shouldSendNewsletter = false
    @State private var numberOfLikes = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    DatePicker("Birthdate", selection: $birthday, displayedComponents: .date)
                }
                
                Section(header: Text("Actions")) {
                    Toggle("Send Newsletter", isOn: $shouldSendNewsletter)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    Stepper("Number of Likes", value: $numberOfLikes, in: 1...100)
                    Text("This video has \(numberOfLikes) likes")
                    Link("Developer's website", destination: URL(string: "https://christinarok.github.io/")!)
                }
            }
            .navigationTitle("Accout")
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }

                    Button("save", action: saveUser)
                }
            })
// bug
//            .onTapGesture {
//                hideKeyboard()
//            }
        }
        .accentColor(.red)
    }
    
    func saveUser() {
        print("User Saved")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
