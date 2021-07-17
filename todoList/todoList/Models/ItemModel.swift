//
//  ItemModel.swift
//  todoList
//
//  Created by ssj on 2021/07/17.
//

import Foundation

// identifiable type: 1) List looping하기 좋은 모델 2) DB와 연동하기 좋음

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString // convinent to share with DB
    let title: String
    let isCompleted: Bool
}
