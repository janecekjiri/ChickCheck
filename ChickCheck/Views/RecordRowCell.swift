//
//  RecordRowCell.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct RecordRowCell: View {
    private var count: Int
    private var date: Date
    
    var body: some View {
        HStack {
            Text("\(self.count)")
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(width: 45, alignment: .trailing)
                .foregroundStyle(.black)
            
            Image("egg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Spacer()
            
            Text(self.date.formatted(.dateTime.day().month().year()))
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.black)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.pinkRose)
        .cornerRadius(8)
        .accessibilityElement()
        .accessibilityAddTraits(.isButton)
        .accessibilityLabel("\(count) \(date.formatted(.dateTime.day().month().year())) record row label")
        .accessibilityHint("record_row_hint")
    }
    
    init(count: Int, date: Date) {
        self.count = count
        self.date = date
    }
}

#Preview {
    RecordRowCell(count: 15, date: Date.now)
}
