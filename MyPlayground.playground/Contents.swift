import UIKit
import Foundation

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


var array = ["a","b","c"]

func rightClick(curIndex:Int, len:Int) -> Int {
    var newIndex = curIndex+1
    if newIndex==len {
        newIndex = 0
    }
    return newIndex
}

func leftClick(curIndex:Int, len:Int) -> Int {
    var newIndex = curIndex-1
    if newIndex == -1 {
        newIndex = len-1
    }
    return newIndex
}

var newIdx = rightClick(curIndex: 0, len: 3)
print(array[newIdx])

newIdx = rightClick(curIndex: newIdx, len: 3)
print(array[newIdx])

newIdx = leftClick(curIndex: newIdx, len: 3)
print(array[newIdx])

newIdx = rightClick(curIndex: newIdx, len: 3)
print(array[newIdx])



newIdx = rightClick(curIndex: newIdx, len: 3)
print(array[newIdx])

newIdx = leftClick(curIndex: newIdx, len: 3)
print(array[newIdx])

newIdx = rightClick(curIndex: newIdx, len: 3)
print(array[newIdx])
