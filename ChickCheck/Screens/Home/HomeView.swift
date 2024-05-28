//
//  HomeView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showDeleteAlert = false
    @State private var showDetailModal = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            makeContentView()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(
                            action: {
                                showDeleteAlert = true
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
            isPresented: $showDeleteAlert,
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
        .sheet(isPresented: $showDetailModal, content: {
            DetailView()
        })
    }
    
    private func makeContentView() -> HomeContentView {
        var content = HomeContentView()
        content.onAddButtonTap = {
            showDetailModal = true
        }
        return content
    }
}

#Preview {
    HomeView()
}

struct HomeContentView: View {
    var onAddButtonTap: (() -> Void)?
    
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
                    
                    makeAddButton()
                    
                    Spacer()
                        .frame(width: 20)
                }
            }
        }
    }
    
    private func makeAddButton() -> AddButton {
        var button = AddButton()
        button.onTap = onAddButtonTap
        return button
    }
}
