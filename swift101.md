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

----

## View

* Button 
  * action
  * label: action을 설명하는 view

```swift
Button(action) {
  label 
}

Button {
  action
} label: {
  label
}

// if label is String
Button(label, action)
```

- sheet