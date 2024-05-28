//
//  EmptyInfoView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct EmptyInfoView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image("hen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("empty_view_title")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("empty_view_message")
                .font(.body)
                .multilineTextAlignment(.center)
            
            AddButton()
            
        }
        .padding(10)
        .background(Color.pinkRose)
        .cornerRadius(10)
        //.padding(20)
    }
}

#Preview {
    EmptyInfoView()
}

extension Color {
    static let pinkRose = Color(
        red: 241/255,
        green: 232/255,
        blue: 232/255
    )
}
