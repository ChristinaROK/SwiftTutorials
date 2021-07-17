# SwiftUI Basic

## Proerty&Variables

- struct & class 차이

  - view == struct
    - light weight
    - value type
    - create & destroy and recreated
    - default value (no data stored)
  
- Protocol (keyword / **property wrapper**)

  - Hashable
    - Swift can generate hash value
    - `\.self` == identifier
    - ex. String, Int
    - 만약 `struct` 의 모든 데이터(property)가 hashable type이라면, struct 자체도 hashable이 됨
    
  - Identifiable

  - ObservableObject

  - @ObservedObject

    - @published object의 값이 변하는지 관찰하다가 값이 변하는 순간 view를 업데이트 함
    - subview에 사용. view가 새롭게 로딩되는 순간 해당 obejct의 값도 리로딩됨

  - @StateObect

    - object를 처음 생성할 떄에 사용. View가 새롭게 로딩될때에도 정보가 재로딩되지 않고 기존 정보를 유지한다는 점에서 ObservedObject와 차이가 있음. 

  - EnvironmentObject

  - @State

    - **Struct & View type**에서만 사용 가능한 property wrapper
    - SwiftUI가 값(value)을 해당 property에 저장함. 따라서 property 값(value)이 변하면 이에 따라 View도 변함

  - @Binding

    - property에 값을 직접 저장하지 않고 다른 곳에 저장된 값(value)을 property와 연결함. binding된 property의 값이 변하면 property와 관련된 모든 view가 변함

    ```swift
    struct PlayerView: View {
    	@State var isPlaying: Bool = false // state property (실제 값이 저장)
      
      var body: some View {
        // binding property: state property 인 isPlaying의 projectedValue를 binding property로 보냄
     		PlayButton(isPlaying: $isPlaying) 
      }
    }
    ```

  - @Published

    - **Class type**에서만 사용할 수 있는 property wrapper
    - 

- private 
- public

- final

- static 

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

* Closure
* self 
  * closure에서 변수를 사용할 땐, self.변수로 사용해야 함

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
- Color(color literal)
  - 색상을 직접 팔레트에서 고를 수 있음

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
  - Boolean var로 제어
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
  - .onInsert()
    - list 요소를 추가
  - .listStyle()
    - list formatting 변경
      - GroupedListStyle : 경계선 & 구분선 있음
        -  <img src="/Users/ssj/Library/Application Support/typora-user-images/Screen Shot 2021-07-10 at 6.07.20 PM.png" alt="Screen Shot 2021-07-10 at 6.07.20 PM" style="zoom:33%;" />
      - SidebarListStyle : 경계선 & 구분선이 없음
        - <img src="/Users/ssj/Library/Application Support/typora-user-images/Screen Shot 2021-07-10 at 6.07.51 PM.png" alt="Screen Shot 2021-07-10 at 6.07.51 PM" style="zoom:33%;" />
      - InsetListStyle : 경계선 없음. 구분선 있음. 좌우 패딩 존재
        - <img src="/Users/ssj/Library/Application Support/typora-user-images/Screen Shot 2021-07-10 at 6.08.49 PM.png" alt="Screen Shot 2021-07-10 at 6.08.49 PM" style="zoom:33%;" />
      - InsetGroupedListStype : 경계선 & 구분선 있음 & 좌우 패딩 존재 
        - <img src="/Users/ssj/Library/Application Support/typora-user-images/Screen Shot 2021-07-10 at 6.09.50 PM.png" alt="Screen Shot 2021-07-10 at 6.09.50 PM" style="zoom:33%;" />
      - PlainListStyle : 경계선 없음. 구분선 있음.ㄴ
        - <img src="/Users/ssj/Library/Application Support/typora-user-images/Screen Shot 2021-07-10 at 6.11.15 PM.png" alt="Screen Shot 2021-07-10 at 6.11.15 PM" style="zoom:33%;" />
  - listRowBackground
    - list의 백그라운드 색상을 변경
  
- .onApper()
  - View(수식하고 있는)가 나타날 때 시간차를 두고 Block을 나타냄
  - DispatchQueue.main
    - task(block) 실행을 스케줄링하는 object. task가 main thread에서 순차적으로(synchronously) 또는 불릴때 실행되는 것처럼 순차적이지 않게 (asynchronously) 실행됨
    - .asynAfter()
  
- .onDisappear()
  - 예를 들어, user가 view를 종료할 때 database에서 데이터 가져오는 액션을 중지하게 하기 위해 사용됨
  
- .onChange()

- ProgressView()

- LazyVStack
  - 큰 데이터를 한 번에 불러오지 않는 장점 
  
- ScrollView
  - view를 horizontal, vertical하게 스크롤 가능
  - LazyV(H)Stack + ForEach와 주로 같이 쓰임
  
- .onTapGesture()
  - 클릭 또는 더블 클릭시  closure를 실행
  
- EditMode (Enumeration)
  - case
    - active
    - inactive
    - transient
  
- EditButton()

- clipShape(Shape())

- .environment(environment value, value): View modifier
  - environment key에(ex. editMode, locale, )에 새로운 value를 할당 
  
- Locale : structure type

  - set: .init(identifier: "ko_KR")
  - get: .current

- formatter

  - NumberFormatter() : class
    - (instance property) groupingSeparator : 미국의 grouping separator는 ","
    - (instance property) numberStyle : decimal, percentage, currency 
  - DateFormatter(): class 

  

##### ToDo

* 
