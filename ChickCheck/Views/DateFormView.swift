//
//  DateFormView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct DateFormView: View {
    var body: some View {
        // Datum label
        HStack {
            Text("Datum")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
            
            Spacer()
        }
        
        Spacer()
            .frame(height: 10)
        
        // Pole pro datum, tlačítko
        HStack(spacing: 10) {
            // Pole pro datum
            ZStack {
                Color.pinkRose
                    .frame(height: 50)
                    .cornerRadius(5)
                
                HStack {
                    Text("9.5.2024")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            )
            
            // Tlačítko
            Image("calendar")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(10)
                .background(Color.pinkRose)
                .cornerRadius(5)
        }
        
        Spacer()
            .frame(height: 5)
        
        // Text pod polem
        HStack {
            Text("Klikněte na tlačítko Kalendáře pro výběr datumu.")
                .font(.footnote)
            
            Spacer()
        }
    }
}

#Preview {
    DateFormView()
}
