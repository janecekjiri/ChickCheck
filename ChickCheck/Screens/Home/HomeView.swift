//
//  HomeView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            HomeContentView()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(
                            action: {
                                showAlert = true
                            },
                            label: {
                                Image(systemName: "trash")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color(.label))
                        })
                    }
                }
        }
        .alert(
            "delete_all_bunches_alert_title",
            isPresented: $showAlert,
            actions: {
                Button(
                    role: .destructive,
                    action: {
                        dismiss()
                        // TODO: Smaž všechny záznamy
                    },
                    label: {
                        Text("yes")
                })
                
                Button(
                    role: .cancel,
                    action: {
                        dismiss()
                    },
                    label: {
                        Text("no")
                    }
                )
            },
            message: {
                Text("delete_all_bunches_alert_message")
            }
        )
    }
}

#Preview {
    HomeView()
}

struct HomeContentView: View {
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
