//
//  ModelStruct.swift
//  Swift101
//
//  Created by ssj on 2021/07/05.
//

import SwiftUI

struct UserModel: Identifiable {
    // 만약 database에서 id를 fetch한다면 해당 property를 initialize하지 않아도 됨
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct ModelStruct: View {
    
    @State var users: [UserModel] = [
//        "Nick", "Emily", "Samantha", "Christina"
        // DataBase에서 해당 값을 fetch 해야함
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Emily", userName: "itememily1995", followerCount: 55, isVerified: false)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        
                        VStack (alignment: .leading){
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        if user.isVerified {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                    }
                    .padding()
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
        }
    }
}

struct ModelStruct_Previews: PreviewProvider {
    static var previews: some View {
        ModelStruct()
    }
}
