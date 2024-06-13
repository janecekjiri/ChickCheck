//
//  EmptyInfoView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct EmptyInfoView: View {
    var onAddButtonTap: (() -> Void)?
    
    private var staticBodyContentView: some View {
        VStack(spacing: 10) {
            Image(decorative: "hen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("empty_view_title")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
            
            Text("empty_view_message")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
        }
        .background(Color.pinkRose)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("empty_view_message")
    }
    
    var body: some View {
        VStack(spacing: 10) {
            self.staticBodyContentView
            
            self.makeAddButton()
        }
        .padding(10)
        .background(Color.pinkRose)
        .cornerRadius(10)
    }
    
    private func makeAddButton() -> AddButton {
        var button = AddButton()
        button.onTap = onAddButtonTap
        return button
    }
}

#Preview {
    EmptyInfoView()
}
