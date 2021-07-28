//
//  AppStorage.swift
//  Swift101
//
//  Created by ssj on 2021/07/18.
//

import SwiftUI

struct AppStorageBootcamp: View {
    
//    @State var currentUserName: String?
    @AppStorage("name") var currentUserName : String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save".uppercased()) {
                let name = "Emily"
                currentUserName = name
                // dictionary (DataBase)
//                UserDefaults.standard.set(name, forKey: "name")
            }
        }
//        .onAppear{
//            currenUserName = UserDefaults.standard.string(forKey: "name")
//        }
    }
}

struct AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
