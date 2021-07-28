//
//  ItemModel.swift
//  todoList
//
//  Created by ssj on 2021/07/17.
//

import Foundation

// identifiable type: 1) List looping하기 좋은 모델 2) DB와 연동하기 좋음
// Immutable Struct (all let properties) : struct의 property 값은 struct 내부에서 함수로만 (getter, setter) 가능함

struct ItemModel: Identifiable {
    let id: String // = UUID().uuidString // convinent to share with DB
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletetion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

// case 1 : 처음 생성됐을 때, id가 새롭게 생성
// ItemModel(title: <#T##String#>, isCompleted: <#T##Bool#>)

// case 2 : 이미 id가 존재하는 model일 때, id를 제외하고 생성
// ItemModel(id: <#T##String#>, title: <#T##String#>, isCompleted: <#T##Bool#>)
