//
//  todoListApp.swift
//  todoList
//
//  Created by ssj on 2021/07/17.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */
@main
struct todoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            // view default => navigationView
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
