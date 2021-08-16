# SwiftUI Basic

## Proerty&Variables

- Property는 struct / class / enum이 생성될 때 **반드시 초깃값을 할당**받아야 함

- Property Type and Initialization

  - Stored Property (class & struct type)

    - Initialization Method

      1. by (basic) initializer

      ```swift
      struct Blocker {
        let name: String
        init() {
          name = "eating"
        }
      }
      
      let eater = Blocker()
      print("default name is : \(eater.name)")
      ```

      2. by Custom Initializer

         : init method의 파라미터를 사용해 value 값을 변경할 수 있음

         ```swift
         struct Blocker {
           let name: String
           var currentAmount: Float
           init(name:String, todaySpent spent: Float, total: Float) {
             name = name
             currentAmount = total - spent 
           }
         }
         
         let eater = Blocker(name: "eating", todaySpent: 200, total: 50000)
         ```

      3. by default value: `init()` method 없이 value를 property에 직접 할당해주는 방법

      * Lazy Stored Property: property가 처음 사용되기 전까지는 initialize하지 않음

        * usage
          1. 외부 요소에따라 값이 변하는 property인 경우
          2. computationally expensive

        * 주의 : multiple threading

      ```swift
      // must be "var" type!!! no "let"
      lazy var propertyName
      ```

      

  - Computed Property (enumeration & class & struct type)

    - 값이 저장되는 것이 아니라 **getter, setter** (optional)로 값을 indirectly하게 받도록 함. 값이 매번 변하기 때문에 항상 **var** 로 선언해야함
    
    ```swift
    var square = Rect(size: Size(width: 10, height: 10)) 
    let initialCenter = square.center // center의 getter 사용
    square.center = Point(x: 15, y: 15) // center의 setter 사용
    
    ```
    
    * getter & setter 구현 
    
    ```swift
    struct Point {
      var x = 0.0, y = 0.0
    }
    
    struct Size {
      var width = 0.0, height = 0.0
    }
    
    struct Rect {
      var origin = Point()
      var size = Size()
      var center: Point {
        get {
          let centerX = origin.x + (size.width / 2)
          let centerY = origin.y + (size.height / 2)
          return Point(x: centerX, y: centerY)
        }
        set(newCenter: Point) {
          origin.x = newCenter.x - (size.width / 2)
          origin.y = newCenter.y - (size.height / 2)
        }
      }
    }
    ```
    
    * getter & setter 간결한 코드
      * `newValue` : swift buit-in parameter
    
    ```swift
    struct Rect {
      var origin = Point()
      var size = Size()
      var center: Point {
        get { // return 없어도 자동으로 return 됨
          Point(x: origin.x + (size.width / 2), y: origin.y + (size.height / 2))
        }
        set() { // parameter 별로도 지정하지 않아도 자동으로 newValue로 세팅됨
          origin.x = newValue.x - (size.width / 2)
          origin.y = newValue.y - (size.height / 2)
        }
      }
    }
    ```

* Property Observers

  * property의 **값이 할당되는 (set) 순간 (값이 변하지 않아도 호출됨)**  해당 함수가 호출됨. 
  * *주의* : inherited or computed property는 property observer 직접 사용하지 않아도 됨
    * inherited property 
      * overriding을 사용 
    * computed property
      * setter를 사용
  * **`willSet`** : value에 값이 할당되기 직접에 호출됨
    * `newValue` : swift buit-in parameter
  * **`didSet`** : value에 값이 할당된 직후 호출됨
    * `oldValue` : swift buit-in parameter

  ```swift
  class StepCounter {
    var totalSteps: Int = 0 {
      willSet(newTotalSteps) { // <=> newValue
        print("About to set totalStpes to \(newTotalSteps)")
      }
      didSet {
        if totalSteps > oldValue { // oldValue <- 기존 totalSteps
          print("Added \(totalSteps - oldValue) steps")
        }
      }
    }
  }
    
  let stepCounter = StepCounter()
  stepCounter.totalSteps = 200 
  // About to set totalSteps to 200
  // Added 200 steps
    
  ```

* Property Wrapper

  * property value를 DB에 저장하는 등, **value storage에 관련된 처리를 담당하는** 코드 (기존 property 정의하는 코드 위에 쌓는 별개의 layer라고 생각할 수 있음. 여러 property에 사용될 수 있음)
  * `wrappedValue` : swift buit-in parameter

  ```swift
  @propertyWrapper
  struct TwelveOrLess {
    private var number = 0 // TwelveOrLess.number와 같이 property를 직접적으로 호츌하지 못함. TwelveOrLess.wrappedValue와 같이 사용해 getter로 호출해야 함
    var wrappedValue: Int { 
      get {
        return number
      }
      set {
        number = min(newValue, 12)
      }
    }
  }
  
  // application
  struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
  }
  
  var rectangle = SmallRectangle()
  rectangle.height = 24
  print(renctangle.height)
  // 12
  
  ```

  

- Protocol (keyword / **property wrapper**)

  - Hashable
    - Swift can generate hash value
    - `\.self` == identifier
    - ex. String, Int
    - 만약 `struct` 의 모든 데이터(property)가 hashable type이라면, struct 자체도 hashable이 됨
    
  - Identifiable

  - ObservableObject

    - **ViewModel class의 type**. ObservableObject 타입의 object에만 @ObservedObejct, @StateObject property wrapper를 붙일 수 있음

      ```swift
      class ViewModel: ObservableObject {
        @Published var dataArray: [String] = []
      }
      ```

  - @ObservedObject

    - @published object의 값이 변하는지 관찰하다가 값이 변하는 순간 view를 업데이트 함
    - **subview**에 사용. view가 새롭게 로딩되는 순간 해당 obejct의 값도 리로딩됨
    - 아직 왜 subview에서 stateObject가 아닌 이 wrapper를 사용해야하는지 모르겠음...

  - @StateObect

    - **object (property)를 처음 생성**할 떄에 사용. View가 새롭게 로딩될때에도 정보가 재로딩되지 않고 기존 정보를 유지한다는 점에서 ObservedObject와 차이가 있음. 

  - @EnvironmentObject

    - view에 object을 인자로 넘겨줄 필요가 없음. 따라서 subview 중에서 modelView object가 필요한 subview에서만 environmentObject wrapper를 사용해서 접근할 수 있음

    ```swift
    struct MainView: View {
    	
      // ViewModel의 obejct을 처음으로 할당 받음
      @StateObject var viewModel: ViewModel = ViewModel()
      
      var body: some View {
        NavigationView {
          ...
        }
        .environmentObject(viewModel) // subview에서 @EnvironmentObject로 access할 수 있도록 object를 environmentObject로 만듦
      }
    }
    
    struct SubView: View {
      
      @EnvironmentObject var viewModel: ViewModel
      
      // SubView 생성할 때 initialize하지 않아도 viewModel 변수에 값을 할당받음
      ...
    }
    ```

    * 앱 전반적으로 general(commonly)하게 사용되는 viewModel만 environmentObject로 만들어 사용하는 것이 좋음 (혼란을 방지하는 차원)

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
    - object 값이 변하면 해당 object를 사용하는 모든 view (observableobject & stateobject)에 변경 사항이 반영됨

/struct & class 차이

- view == struct
  - light weight
  - value type
  - create & destroy and recreated
  - default value (no data stored)

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
- .clipShape(Shape()) : view의 모양을 shape 모양으로 자름
- .stroke() / .strokeBorder() : shape(Circle, Rectangle, ...) 의 테두리 설정 
- .border() : shape을 제외한 view (text, image)의 테두리 설정
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
- UIScreen.main.bounds.width (height) : portrait mode의 width 값. 따라서 landscape모드로 변경되도 landscape mode의 width 값으로 변환도지 않음.
- GeometryReader : View의 정확한 x,y,z 값을 알고 싶을 때 사용, 하지만 computationally expensive하기 때문에 가급적이면 UIScreen을 사용.
- withAnimation  { }
- .transition() : View에 움직임을 추가함. `withAnimation` 과 함께 사용됨 
  - .slide `ex) .transition(.slide)`
  - .scale ex) `.transition(scale)`
  - `transition(.move(edge: .bottom))`

* TabView: 하단 탭 바를 통해 뷰를 이동할 수 있음
  * .tabItem { View }


---

### DataBase

* UserDefault	
  * userName, isPremium처럼 user 관련 small data를 앱 내에서 저장할 수 있는 DB
  * small data의 범위를 잘 모르겠다. view model 값도 저장할 수 있을까?

```swift
// dictionary type 
// forKey인 key 값을 기억해야함. key 값으로 데이터를 가져오기 때문에

// save to DB
UserDefaults.standard.set(value, forKey: "id")
// get from DB
UserDefaults.standard.integer(forKey: "id")
```

* @AppStorage
  * @AppStorage wrapper가 붙여진 property는 값이 할당되는 순간 DB에 자동 저장됨. 또한 property가 불리는 순간 DB에 저장된 값이 자동으로 로드됨. 따라서 UserDefault에 일일이 저장하고 값을 가져올 필요가 없음
  * (추가) optional value는 반드시 safe coding 해야 함. 즉 if `existValue  = optionalValue { }` 또는` optionalValue ?? "defaultValue"` 로 값을 불러와야 함

```swift
@AppStorage("id") var currentId: Integer? 
```

* Codable (type)

  * data encoding, decoding (serializing, deserializing)이 가능해 json과 같은 형태로 data 전송이 가능한 데이터 타입

  * codable datatypes

    * String, Int, Double, Date, Data, URL
    * 위 datatype을 property로 갖고 있는 Array, Dictionary, Optional


---

### Date 

##### Date formatting 용도

* DateFormatter : Date -> String 
  * .local = Locale(identifier: "ko_KR") / "en_US"
  * .dateFormat = String
    * year
      * "YYYY"
        * ex. 2021
    * month
      * "MM"
        * ex. 07
      * "MMM"
        * ex. 7월
    * day
      * "dd"
        * ex. 21
    * weekdays
      * "E"
        * ex. 수
      * "EEEE"
        * ex. 수요일
  * .dateStyle
    * .full
      * ex. 2021년 07월 21일 수요일
    * .long
      * ex. 2021년 07월 21일
    * .medium
      * ex. 2021.07.21

##### Date 간격을 계산

* Calendar
  * **Date간 계산이나 비교**를 위해 사용되는 struct. DateComponent와 Date간 교환할 수 있는 함수를 제공
  * initialize
    * Calendar.current: User가 사용하는 Calendar를 가져옴
  * DateComponent -> Date
    * Calendar.current.date(DateComponent)
  * Date -> DateComponent
    * Calendar.current.component(format, Date)
  * Date 연산
    * Calendar.current.nextDate() : 파라미터 Component를 만족하는 Date의 바로 다음 날짜를 구함
* DateComponent
* DateFormatter: Date를 형식 맞춰서 String으로 변경
* Date
