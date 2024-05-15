//
//  HomeView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            List {
                RecordRowCell(count: "88", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
                RecordRowCell(count: "5", date: "8.5.2024")
            }
            .listRowSpacing(10)
            .listRowSeparator(.hidden)
            .listStyle(.plain)
            .safeAreaInset(edge: .bottom) {
                Spacer()
                    .frame(height: 65)
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    AddButton()
                    
                    Spacer()
                        .frame(width: 20)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
