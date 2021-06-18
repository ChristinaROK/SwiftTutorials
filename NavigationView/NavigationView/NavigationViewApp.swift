//
//  NavigationViewApp.swift
//  NavigationView
//
//  Created by ssj on 2021/06/06.
//

import SwiftUI

@main
struct NavigationViewApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.red]
    }
    
    var body: some Scene {
        WindowGroup {
            RedOneView()
        }
    }
}
