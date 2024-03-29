//
//  ObjectWrapper.swift
//  Swift101
//
//  Created by ssj on 2021/07/17.
//

import SwiftUI

struct FruitModel: Identifiable{
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "oragne", count: 88)
        let fruit2 = FruitModel(name: "banana", count: 2)
        let fruit3 = FruitModel(name: "watermelon", count: 880)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
        
    }
    
    func deleteFruit(index: IndexSet){
        fruitArray.remove(atOffsets: index)
    }
    
}

struct ObjectWrapper: View {
    
//    @State var fruitArray: [FruitModel] = []
//    property wrapper : this property might be changed! please update!
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView{
            List {
                
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack{
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }

            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing:
                                NavigationLink(
                                    destination: SecondScreen(fruitViewModel: fruitViewModel),
                                    label: {
                                        Image(systemName: "arrow.right")
                                            .font(.title)
                                    }
                                )
            )
            
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    // SubView에서는 ObservedObject property wrapper를 사용해 ...
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}

struct ObjectWrapper_Previews: PreviewProvider {
    static var previews: some View {
        ObjectWrapper()
    }
}
