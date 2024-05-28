//
//  AddButton.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct AddButton: View {
    var onTap: (() -> Void)?
    @State private var isPressed = false
    
    var body: some View {
        Image(systemName: "plus.circle.fill")
            .renderingMode(.template)
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundStyle(.white, Color.green.opacity(isPressed ? 0.5 : 1))
            .onTapGesture {
                withAnimation {
                    isPressed.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                            isPressed.toggle()
                        }
                    }
                }
                onTap?()
            }
    }
}

#Preview {
    AddButton()
}
