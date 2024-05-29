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
            NavigationStack {
                DetailView(type: .new)
            }
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
                ZStack(alignment: .center) {
                    RecordRowCell(count: "88", date: "8.5.2024")
                    
                    // TODO: Použít zde navigationDestination
                    NavigationLink(destination: DetailView(type: .update)) {
                        EmptyView()
                    }
                    .opacity(0)
                }
                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                .listRowSeparator(.hidden)
                
                ZStack(alignment: .center) {
                    RecordRowCell(count: "5", date: "7.5.2024")
                    
                    NavigationLink(destination: DetailView(type: .update)) {
                        EmptyView()
                    }
                    .opacity(0)
                }
                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                .listRowSeparator(.hidden)
                
                ZStack {
                    RecordRowCell(count: "13", date: "6.5.2024")
                    
                    NavigationLink(destination: DetailView(type: .update)) {
                        EmptyView()
                    }
                    .opacity(0)
                }
                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                .listRowSeparator(.hidden)
            }
            .listRowSpacing(10)
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
