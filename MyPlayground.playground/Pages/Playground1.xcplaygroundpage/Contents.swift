import UIKit
import Foundation

print("Current Locale: \(Locale.current)")
print("Current Time: \(Date())")

// 1. Test
var calendar = Calendar.current
calendar.locale = Locale(identifier: "ko_KR")
calendar.timeZone = TimeZone(identifier: "Asia/Seoul")!
print("User Timezone: \(calendar.timeZone)")
print("User Calendar: \(calendar)")
print("User Calendar Locale: \(calendar.locale!)")
//print(cal.weekdaySymbols)

// Date -> Component
let currentComponent = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute], from: Date())
print("Current Year: \(currentComponent.year ?? 0)")
print("Current Month: \(currentComponent.month ?? 0)")
print("Current Day: \(currentComponent.day ?? 0)")
print("Current Weekday: \(currentComponent.weekday ?? 0)")
print("Current Hour: \(currentComponent.hour ?? 0)")
print("Current Minute: \(currentComponent.minute ?? 0)")

// Component -> Date (locale X)
let comp2date = calendar.date(from: DateComponents(year: currentComponent.year, month: currentComponent.month, day: currentComponent.day, hour: currentComponent.hour, minute: currentComponent.minute))
print("Current Date: \(comp2date!)") // Date에서는 현재 Locale 적용되지 않음

// 2. App
// BlocekerModel : DateComponent
let weeklyResetDate = DateComponents(weekday: 2) // monday
let monthlyResetDate = DateComponents(day: 13)
let yearlyResetDate = DateComponents(month: 1, day: 12)

// DateComponent -> Date
let coreData = calendar.date(from: weeklyResetDate)
//let coreData = calendar.date(from: monthlyResetDate)
//let coreData = calendar.date(from: yearlyResetDate)
print("Coverting Componet to Date: \(coreData!)")

let coreDate2comp = calendar.component(.weekday, from: coreData!)
print("\(coreDate2comp)")

//let i = 7
//let weekday = cal.weekdaySymbols[i-1]
//
//if let cdResetDate = cal.date(bySetting: .weekday, value: i, of: Date()) {
//    print("\(weekday) : \(cdResetDate)")
//}
//
//// date -> Calendar.DateComponents
//// 둘의 date (=현재)가 왜 다르지?
//// code
//print("Now: \(Date())")
//print("\(cal.dateComponents([.year, .month, .day, .weekday, .hour, .minute], from: Date()))")
//


//let cal = Calendar.current
//
//let dateFormatter = DateFormatter()
//dateFormatter.locale = Locale(identifier: "kr_KR")
//dateFormatter.calendar = cal
//dateFormatter.dateStyle = .medium
//dateFormatter.timeStyle = .medium
//
//
//let todayStart: Date = cal.date(bySettingHour: 0, minute: 0, second: 0, of: Date(), direction: .backward)!
//print("\(dateFormatter.string(from: todayStart))")
//
//let tomorrowStart: Date = cal.date(bySetting: .day, value: 1, of: todayStart)!
//print("\(dateFormatter.string(from: tomorrowStart))")
//
////let nowHour: Date = cal.date(bySetting: .minute, value: 0, of: Date())
////let nowHourr: Date = cal.date(bySetting: .second, value: 0, of: nowHour)!
//let maxHour = 24
//let currentHour = cal.dateComponents([.hour], from: Date())
//print("\(maxHour - currentHour.hour!)")


//var array = ["a","b","c"]
//
//func rightClick(curIndex:Int, len:Int) -> Int {
//    var newIndex = curIndex+1
//    if newIndex==len {
//        newIndex = 0
//    }
//    return newIndex
//}
//
//func leftClick(curIndex:Int, len:Int) -> Int {
//    var newIndex = curIndex-1
//    if newIndex == -1 {
//        newIndex = len-1
//    }
//    return newIndex
//}
//
//var newIdx = rightClick(curIndex: 0, len: 3)
//print(array[newIdx])
//
//newIdx = rightClick(curIndex: newIdx, len: 3)
//print(array[newIdx])
//
//newIdx = leftClick(curIndex: newIdx, len: 3)
//print(array[newIdx])
//
//newIdx = rightClick(curIndex: newIdx, len: 3)
//print(array[newIdx])
//
//
//
//newIdx = rightClick(curIndex: newIdx, len: 3)
//print(array[newIdx])
//
//newIdx = leftClick(curIndex: newIdx, len: 3)
//print(array[newIdx])
//
//newIdx = rightClick(curIndex: newIdx, len: 3)
//print(array[newIdx])
