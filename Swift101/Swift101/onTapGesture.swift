//
//  onTapGesture.swift
//  Swift101
//
//  Created by ssj on 2021/07/04.
//

import SwiftUI

struct onTapGesture: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? Color.green : Color.red)
            
            // Button: 누르면 하이라이트가 나타남
            Button(action: {
                isSelected.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
            })
            
            // TapGesture: 누르면 하이라이트가 나타지 않음 + 코드가 깔끔함
            Text("Tap Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
                .onTapGesture {
                    isSelected.toggle()
                }
            
            // Double Tap (ex. Instagram Like)
            Text("Double Tap Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
                .onTapGesture(count: 2, perform: {
                    isSelected.toggle()
                })
            
            Text("Long Tap Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
                .onLongPressGesture(minimumDuration: 0.2) {
                    isSelected.toggle()
                }

            
            Spacer()
        }
        .padding(40)
    }
}

struct onTapGesture_Previews: PreviewProvider {
    static var previews: some View {
        onTapGesture()
    }
}
