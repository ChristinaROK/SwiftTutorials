# Swift

### Xcode

* storyboard vs swiftUI
  * storyborad (UIkit)
    * old version
  * swiftUI
    * new version
* Shortcuts
  * command + b => build
  * command + shift + L => list of views
  * command + n => new file
  * View + command + "Embedd in List" => duplicating Views in list
  * control + i => 코드 indent 재정렬
  * command + r => run
  * command + shift + a => dark mode <-> light mode

---

### Concpet

* view
* modifier

---



### SwiftUI

* swift view file
* max: **10 views**

##### Views

- Shortcut 
  - command + shift + L
- Types
  - Button
  - Text
  - Image
  - Lable => Image와 같은 기능이지만 text 입력 가능
  - Spacer => Spacer 아래의 모든 view를  가장 아래로 배치
  - Link
  - **NaviagtionView**
    - only keep **ONE** !!!
  - **NavigationLink**
  - **Form & Section **
  - TextField => 텍스트 입력 가능
- Extract subview

  * 반복적으로 사용되는 view를 **customized view struct**로 만들어줌
  * View + command => `extract subview` 클릭

##### Stacks

* VStack(spacing) {}: vertical
* HStack() {}: horizontal
* ZStack() {}: depth (overlapping)

##### Modifiers (customize Views)

* modifiers wrap the existed View with **another View** => modifier의 순서가 중요함
* .padding() / .frame()
* .resizable() : Image를 resizable mode로 전환
* .aspctRatio() : Image의 원래 aspect ratio에 맞춤
* .cornerRadius()
* .toggle() => boolean 값 반전
* .renderingMode() : SF Symbol과 같은 사이즈로 만들기
* coloring
  * Color()
  * LinearGradient()
  * .edgesIgnoringSafeArea(.all)
    * 색상을 빈 공간 없이 채우기

##### SF Symbols

* parameter
  * systemName: "command + shift + c -> command + v" (ex. "cloud.sun.fill")


---

### Data

* declarative programming VS imperative programming

* `@state`

  * property wrapper 
  * View의 body에서만 state property에 접근할 수 있기 때문에 **private** 선언해 client의 접근을 막음
  * View는 struct instance이기 때문에 매번 새로 생성되 상태가 유지되지 않는 반면 state instance는 View 내부에서도 **데이터의 상태가 유지됨**

  ```swift
  struct PlayerView: View {
  	@State private var isPlaying:Bool = false
    
    var body: some View {
      // accessing to state property available
      VStack {
        PlayButton(isPlaying: $isPlaying)
      }
      
    }
  }
  ```

* `@Binding`

  * property wrapper 
  * make two-way **connection** between property that stores data and the View that displays and changes the data
  * binding property 표시 => `$property_name` 

  ```swift
  struct PlayButton: View {
  	@Binding var isPlaying: Bool
    
    var body: some View {
      Button(action: {
        self.isPlaying.toggle()
      }) {
        Image(systemName: isPlaying : "pause.circle" : "play.circle")
      }
    }
  }
  ```

  

----

### MVVM (Model & View & ViewModel (=Control))

* **Model**

* **View**
  * dumb, stupid 😅
* **ViewModel**
  * class
    * why: to maintain **state** (persistent)

```swift
final class ClassName: ObservableObject {
  // final (keyword): no subclass => no overriding 
  // Observable (protocol) (property wrapper): able to observe outside
}
```

* `@Published` (protocol) (property wrapper)
  * property의 변화를 감지해서 View를 변화시켜줌







### Swift101

* Struct vs Class
  * Struct
    * value type (<=> created and withdraw all the time! state가 유지되지 않음)
  * Class
    * reference type

* types
  * Identifiable
  * UUID
  * URL

* List

```swift
List(list, id: \.id) {item in ...}
// for id in list:
//	list[id]...
```



---

### Problems

1. NavigationView
   1. Destination 페이지로 넘어갔을 때 상위 view가 여전히 보임 => NavigationView 위치 선정?
   2. List of NavigationLink와 단일 NavigationLink간의 spacing이 발생
   3. List of NavigationLink와 단일 NavigationLink간의 모양이 동일하지 않음
