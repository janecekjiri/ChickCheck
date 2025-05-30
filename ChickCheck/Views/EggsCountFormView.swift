//
//  EggsCountFormView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct EggsCountFormView: View {
    @Binding var eggsCount: Int?
    @FocusState private var isEggsCountFieldActive: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("eggs_count")
                    .font(.title)
                    .fontWeight(.bold)
                    .accessibilityRemoveTraits(.isStaticText)
                    .accessibilityAddTraits(.isHeader)
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 10)
            
            TextField("insert_eggs_count", value: self.$eggsCount, format: .number)
                .keyboardType(.numberPad)
                .focused(self.$isEggsCountFieldActive)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .padding(.vertical, 12)
                .padding(.horizontal, 10)
                .background(Color.pinkRose)
                .cornerRadius(5)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("hide_keyboard") {
                            self.isEggsCountFieldActive = false
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                )
                .accessibilityValue(self.makeTextFieldAccessibilityValue())
        }
    }
    
    private func makeTextFieldAccessibilityValue() -> Text {
        if let eggsCount {
            return Text("\(eggsCount) eggs count text field value")
        }
        return Text("insert_eggs_count")
    }
}

#Preview {
    @State var eggsCount: Int? = nil
    return EggsCountFormView(eggsCount: $eggsCount)
}
