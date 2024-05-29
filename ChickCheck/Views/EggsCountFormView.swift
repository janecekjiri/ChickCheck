//
//  EggsCountFormView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct EggsCountFormView: View {
    @State private var eggsCount: Int?
    @FocusState private var isEggsCountFieldActive: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("eggs_count")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 10)
            
            TextField("insert_eggs_count", value: $eggsCount, format: .number)
                .keyboardType(.numberPad)
                .focused($isEggsCountFieldActive)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 10)
                .background(Color.pinkRose)
                .cornerRadius(5)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("hide_keyboard") {
                            isEggsCountFieldActive = false
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                )
        }
    }
}

#Preview {
    EggsCountFormView()
}
