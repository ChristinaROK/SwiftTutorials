//
//  LocaleBootcamp.swift
//  SwiftIntermediate
//
//  Created by ssj on 2021/09/11.
//

import SwiftUI
import Foundation

struct MainViewBootcamp: View {

    @Environment(\.locale) var locale: Locale
    @State var choice: String = "en_US"
    
    var body: some View {
        NavigationView {
            VStack{
                
            Text("current: \(locale.description)") // 문제: 값이 변하지 않음!!!!
            //Text("\(Locale.current.identifier)")
                
                Button {
                    choice="en_US"
                    
                }
                    label: {
                        Text("US")
                            .bold()
                            .padding()
                    }
                
                Button {choice="kr_KR"}
                    label: {
                        Text("KR")
                            .bold()
                            .padding()
                    }
            }
        }
        .environment(\.locale, .init(identifier: choice))
    }
}

struct LocaleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MainViewBootcamp()
            .environment(\.locale, .init(identifier: "fr_LU"))
    }
}
