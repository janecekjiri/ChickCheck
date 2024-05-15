//
//  EmptyView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image("hen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("Snesly už Vaše slepičky?")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Zatím jste neuložili žádnou snůšku. Pokud už Vaše slepičky snesly vajíčka, můžete je uložit tapnutím na zelené tlačítko “+” níže.")
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
    EmptyView()
}

extension Color {
    static let pinkRose = Color(
        red: 241/255,
        green: 232/255,
        blue: 232/255
    )
}
