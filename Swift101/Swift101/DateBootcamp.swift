//
//  DateBootcamp.swift
//  Swift101
//
//  Created by ssj on 2021/07/22.
//

import SwiftUI

enum CustomDays: String, CaseIterable, Identifiable {
    case 월요일 , 화요일, 수요일, 목요일, 금요일, 토요일, 일요일
    var id: String { self.rawValue }
}

struct DateBootcamp: View {
    
    @State var thisWeekDay = CustomDays.월요일
    
    var body: some View {
        
        // if period is 2 (Mon), return next most recent Monday Date
//        return Text("\(Calendar.current.nextDate(after: Date(), matching: DateComponents(weekday:2), matchingPolicy: .nextTime)!)")
        
        // if period is 1 day , return next most recent 1st day Date
        let certainDate = Calendar.current.date(from: DateComponents(year:2021, month: 4, day: 2)) ?? Date()
        return Text("\(Calendar.current.nextDate(after: certainDate, matching: DateComponents(day:31), matchingPolicy: .previousTimePreservingSmallerComponents)!)")
        
        // if period is Jan 1st date , return next most recent Jan 1st day Date
        return Text("\(Calendar.current.nextDate(after: Date(), matching: DateComponents(month:1, day: 1), matchingPolicy: .nextTime)!)")
        
        // Date -> Component
        let todayWeek = Calendar.current.component(.weekday, from: Date())
        //return Text("\(todayWeek) and \(Date())")
        
        // Component -> Date
        var components = DateComponents()
        components.year = 2021
        components.month = 7
        components.day = 4
        
        let date = Calendar.current.date(from: components) ?? Date()

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "kr_KR")
        formatter.dateStyle = .long
        formatter.dateFormat = "yyyy/MM/dd EEEE"
        let formattedDate = formatter.string(from: date)
        
        return Text("\(formattedDate)")
        
    }
}

struct DateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DateBootcamp()
    }
}
