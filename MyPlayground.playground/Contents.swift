import UIKit
import Foundation


print("Now: \(Date())")
// 1. DateComponent -> Date
let cal = Calendar.current
//print(cal.weekdaySymbols)


let modelResetDate = DateComponents(month:3, day:28)
let comp2date = cal.date(from: modelResetDate)
print("\(comp2date ?? Date())")
let date2comp = cal.component(.day, from: comp2date!)
print("\(date2comp)")

let i = 7
let weekday = cal.weekdaySymbols[i-1]

if let cdResetDate = cal.date(bySetting: .weekday, value: i, of: Date()) {
    print("\(weekday) : \(cdResetDate)")
}

// date -> Calendar.DateComponents
// 둘의 date (=현재)가 왜 다르지?
print("Now: \(Date())")
print("\(cal.dateComponents([.year, .month, .day, .weekday, .hour, .minute], from: Date()))")



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
