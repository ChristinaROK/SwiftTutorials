//
//  dateView.swift
//  Swift101
//
//  Created by ssj on 2021/07/12.
//

import SwiftUI

protocol DateFormatterProtocol {
    var dateStyle: DateFormatter.Style { get set }
    func string(from date: Date) -> String
}

extension DateFormatter: DateFormatterProtocol { }

struct PreviewDateFormatter: DateFormatterProtocol {
    
    let dateFormatter : DateFormatter
    
    init(locale: Locale) {
        dateFormatter = DateFormatter()
        dateFormatter.locale = locale
    }
    
    var dateStyle: DateFormatter.Style {
        get {
            dateFormatter.dateStyle
        }
        set {
            dateFormatter.dateStyle = newValue
        }
    }
    
    func string(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}

struct dateViewAbstraction: View {
    let date: Date
    var dateFormatter : DateFormatterProtocol
    
    init(dateFormatter: DateFormatterProtocol = DateFormatter()) {
        date = Date()
        self.dateFormatter = dateFormatter
        self.dateFormatter.dateStyle = .long
    }
    
    var dateValue: String {
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        Text(dateValue)
    }
}

struct dateView_Previews: PreviewProvider {
    static var previews: some View {
        dateViewAbstraction(dateFormatter: PreviewDateFormatter(locale: Locale(identifier: "ko_KR")))
    }
}
