# SwiftUI Basic

## Proerty&Variables

- struct & class 차이

  - view == struct
    - light weight
    - value type
    - create & destroy and recreated
    - default value (no data stored)
- keyword / protocol / property wrapper
- - @State
    - SwiftUI가 해당 property의 값을 저장함. 따라서 property 값이 변하면 이에 따라 view도 변함
  - @Binding
  - @Published
  - private 
  - public
  - final
- safe coding
  - if let
  - let gaurd

```swift
var optionalVar: String?

if let newVar = optionalVar {
  pass
} else {
  pass
}

// optionalVar에 값이 존재하면 newVar에 값을 assign, 아니면 break
let guard newVar = optionalVar else {
  pass
  return
}
```



----

## View

* Button 
  * action
  * label: action을 설명하는 view

```swift
Button(action) {
  label 
}
// parameter 대신 view builder인 {}를 사용

Button {
  action
} label: {
  label
}

// if label is String
Button(label, action)
```

- sheet

* Form: 주로 text, toggle, button 등을 담은 section(컨트롤)들을 그룹핑하는 콘테이너
  * view builder
  * accentColor: datapicker 등 view의 기본 색상을 바꿈
* Section: 컨트롤
  * grouping views together
* TextField: 글자 입력
  * keyboard 제거 함수 추가해야함
* DatePicker: 날짜
* Picker: 후보군 중 선택할 수 있게 만든 컨드롤
  * pickerStyle()
    * MenuPickerStyle
    * WheelPickerStyle
    * SegmentedPickerStyle

- Toggle (on&off)
  - toggleStyle: 버튼 색상 바꿈
- .toolbar()
  - ToolbarItem
  - ToolbarItemGroup: 가장 상단에 버튼 그룹을 생성
- GeometryReader:  함수로 구성된 뷰 콘테이너
  - parent view의 사이즈를 알 수 있다???
- NavigationView
  - 상단에 view를 생성해주는 container of views
  - ~~navigationBarTitle : 상단에 이름 작성~~ -> *NavigationTitle*
  - ~~navigationBarItems: 상단 또는 하단에 버튼 추가~~ -> *ToolbarItemGroup*
- List
  - Section
    - 다른 종류의 list 노출 가능
    - header, footer name 입력 가능
  - .onDelete()
    - list의 요소를 삭제
  - .onMove()
    - list의 요소를 이동
  - .listStyle()
    - list formatting 변경
  - listRowBackground
    - list의 백그라운드 색상을 변경
- .onApper()
  - View(수식하고 있는)가 나타날 때 시간차를 두고 Block을 나타냄
  - DispatchQueue.main
    - task(block) 실행을 스케줄링하는 object. task가 main thread에서 순차적으로(synchronously) 또는 불릴때 실행되는 것처럼 순차적이지 않게 (asynchronously) 실행됨
    - .asynAfter()
- .onDisappear()
  - 예를 들어, user가 view를 종료할 때 database에서 데이터 가져오는 액션을 중지하게 하기 위해 사용됨
- ProgressView()
- LazyVStack
  - 큰 데이터를 한 번에 불러오지 않는 장점 
- ScrollView

##### ToDo

* 
