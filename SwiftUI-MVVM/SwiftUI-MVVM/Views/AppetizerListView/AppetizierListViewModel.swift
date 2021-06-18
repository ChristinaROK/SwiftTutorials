//
//  AppetizierListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by ssj on 2021/06/06.
//

import Foundation

final class AppetizierListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = [] // Model
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        isLoading = true
        
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
