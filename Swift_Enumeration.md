# Enumeration

### About

- 서로 관련있는 value들을 **하나의 그룹**으로 묶어주는 역할. 특히, emunerations은 value들의 type을 하나로 통일해주기 때문에 안전하게(*type-safe*) 하게 그룹핑할 수 있음.

> An enumeration defines a common type for a group of related values and enables you to work with those values in a type-sfae way within your code.

* enumeration은 서로 다른 type(string, character, integer, float, ...)의 value를 가질 수 있음. 
* 특징
  - 하나의 Type이기 때문에 enumeration 변수명은 대문자로 시작함. (ex. Status)
  - First-class Type
    - 따라서 Class의 기능 (initializer, property, intance method, extension, protocol) 사용 가능함.

### Syntax

```swift
// syntax 1
enum Status {
  case bad
  case soso
  case good
}

// syntax 2 
enum Status {
  case bad, soso, good
}
```

* `bad`, `soso`, `good` 과 같이 enumeration 내부에서 정의된 값(=enumeration value)을 **case** 라고 하며 `case` keyword를 사용함.
* 모든 value들의 type은 `Status type`.

### Assigning

```swift
currentStatus = Status.good

// syntax 1
switch currentStatus {
  case .good:
  	print("Very good job!")
  case .soso:
  	print("Quite good. Keep working!")
  case .bad:
  	print("Oh No! Work harder!")
}

// syntax 2
switch currentStatus {
  case .good:
  	print("Very good job!")
 	default:
  	print("Keep working harder!")
}

// Prints "Very good job!"

```

- 제어문인 **switch** 구문을 사용해 변수(`currentStatus`)에 enumeration value를 할당할 수 있음.

### Iterating

```swift
enum Status: CaseIterable {
  case bad, soso, good
}

let numberOfCases = Status.allCases.count
print("\(numberOfCases) states available.")

// Prints "3 states available"

for state in Status.allCases {
  print(state)
}

// bad
// soso
// good
```

* **CaseIterable** 을 사용해 모든 case를 collection type으로 만들 수 있음.
* Collection type은 `allCases` 를 사용해 모든 case 값에 접근 할 수 있음
  * `for ... in ` loop iteration
  * `count`

### Associated Values

```swift
enum Budget {
  case food(status: String)
  case shopping(status: String)
  case totalBalance(amount: Float)
}

let budget = Budget.food(status: "good")
switch budget {
 case let .totalBalance(amount):
  print("$\(amount) left.")
 case let .food(status):
  print("Food budget status: \(status).")
 case let .shopping(status):
  print("Shopping budget status: \(status).")
}

// Prints "Food budget status: good."
```

- `enum` 의 각 case에 값(value) 뿐만 아니라  데이터 타입(type) 또한 지정할 수 있는데, 이를 **associated value**라고 함.
- 예산의 세부 내역 (식비, 쇼핑비, 등등)을 나타내는 `Budget` enumerate에서 각 예산 항목별 상태는 String 타입으로, 예산의 총 잔액은 Float 타입으로 저장하도록 했는데 이를 associated value라고 함. 
- Associated value를 사용해 각 case의 자세한 정보를 표시해줄 수 있음.
- `switch` 제어문을 사용해 associated value에 접근할 수 있음. 





### Reference

[swift official doc]()

[hackingwithswift](https://www.hackingwithswift.com/sixty/2/9/enum-associated-values)

