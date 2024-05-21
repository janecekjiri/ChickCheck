//
//  DetailView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack(spacing: 0) {
            DateFormView()
            
            Spacer()
                .frame(height: 20)
            
            EggsCountFormView()
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("save")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
            })
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.green)
            .cornerRadius(25)
            
            Spacer()
                .frame(height: 20)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    DetailView()
}
