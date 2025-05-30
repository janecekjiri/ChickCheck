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
            .foregroundStyle(.white, Color.green.opacity(self.isPressed ? 0.5 : 1))
            .onTapGesture {
                withAnimation {
                    self.isPressed.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                            self.isPressed.toggle()
                        }
                    }
                }
                self.onTap?()
            }
            .accessibilityRemoveTraits([.isImage])
            .accessibilityAddTraits([.isButton])
            .accessibilityLabel("add_button")
            .accessibilityHint("add_button_hint")
    }
}

#Preview {
    AddButton()
}
