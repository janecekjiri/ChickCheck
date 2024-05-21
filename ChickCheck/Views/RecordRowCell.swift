//
//  RecordRowCell.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct RecordRowCell: View {
    private var count: String
    private var date: String
    
    var body: some View {
        HStack {
            Text(count)
                .font(.largeTitle)
                .fontWeight(.medium)
                .frame(width: 45, alignment: .trailing)
                .foregroundStyle(.black)
            
            Image("egg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Spacer()
            
            Text(date)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.black)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.pinkRose)
        .cornerRadius(8)
        .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
    
    init(count: String, date: String) {
        self.count = count
        self.date = date
    }
}

#Preview {
    RecordRowCell(count: "12", date: "8.5.2024")
}
