//: [Previous](@previous)

import Foundation

print("Default Locale: \(Locale.current.identifier)")
print("Default Timezone: \(TimeZone.current)")
print("Default Date: \(Date())")

let koreanLocale = Locale.init(identifier: "kr_KR")
let koreanTimeZone = TimeZone(identifier: "Asia/Seoul")

var calendar = Calendar.current
calendar.locale = koreanLocale
calendar.timeZone = koreanTimeZone!

var dateFormatter = DateFormatter()
dateFormatter.locale = koreanLocale
dateFormatter.timeZone = koreanTimeZone!
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .medium

var currentComponent = calendar.dateComponents([.year, .month, .day, .weekday, .hour, .minute], from: Date())

print("Current Year: \(currentComponent.year ?? 0)")
print("Current Month: \(currentComponent.month ?? 0)")
print("Current Day: \(currentComponent.day ?? 0)")
print("Current Weekday: \(currentComponent.weekday ?? 0)")
print("Current Hour: \(currentComponent.hour ?? 0)")
print("Current Minute: \(currentComponent.minute ?? 0)")

var comp = DateComponents()
comp.timeZone=koreanTimeZone
comp.year = currentComponent.year
comp.month = currentComponent.month
comp.day = currentComponent.day
comp.hour = currentComponent.hour
comp.minute = currentComponent.minute

let dateFromComponent = calendar.date(from: comp)

print("Restruct Date from Components: \(dateFromComponent!)")
print("Restruct Date from Components: \(dateFormatter.string(from: dateFromComponent!))")

let todayFullSet = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: Date())! // D-0인 순간 D-7로 변경되도록 세팅
let todayZeroSet = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: Date())! // D-0을 만들기위해 시간 제로 세팅
print("Change Time of Today: \(todayZeroSet)")

let closestNextDate = calendar.nextDate(after: todayFullSet,
                                        matching: DateComponents(hour: 23, minute: 23, second: 59, weekday: 1), // 월요일 -> 9.13
                                        //matching: DateComponents(day: 12, hour: 23, minute: 59, second: 59), // 12일 -> 9.12
                                        //matching: DateComponents(month: 9, day: 11, hour: 23, minute: 23, second: 59), // 2021.9.12
                                        matchingPolicy: .previousTimePreservingSmallerComponents)
print("NextDate Result: \(closestNextDate!)")

var nextDateComp = calendar.dateComponents([.year, .month, .day], from: closestNextDate!)
print("Current Year: \(nextDateComp.year ?? 0)")
print("Current Month: \(nextDateComp.month ?? 0)")
print("Current Day: \(nextDateComp.day ?? 0)")
//let closestNextDateZeroset = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: closestNextDate!,
//                                           matchingPolicy: .strict)!
//print("Change Time of NextDate: \(closestNextDateZeroset)")


let offSet = calendar.dateComponents([.day],
                                     from: DateComponents(year:currentComponent.year,
                                                        month:currentComponent.month,
                                                        day:currentComponent.day
                                     ),
                                     to: DateComponents(year:nextDateComp.year,
                                                     month:nextDateComp.month,
                                                     day:nextDateComp.day)
                        )
//let offSet: DateComponents = calendar.dateComponents([.day], from: todayZeroSet, to: closestNextDateZeroset)
print("D-\(offSet.day!)")

//: [Next](@next)
