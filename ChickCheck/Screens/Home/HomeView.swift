//
//  HomeView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recordStore: RecordStore
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
        var content = HomeContentView(records: recordStore.recordsExternal)
        content.onAddButtonTap = {
            showDetailModal = true
        }
        return content
    }
}

#Preview {
    HomeView().environmentObject(RecordStore())
}

struct HomeContentView: View {
    var records: [DetailModel]
    var onAddButtonTap: (() -> Void)?
    
    var body: some View {
        ZStack {
            List(records, id: \.date) { detail in
                ZStack(alignment: .center) {
                    RecordRowCell(count: detail.count ?? 0, date: detail.date)
                    
                    NavigationLink(value: detail) {
                        EmptyView()
                    }
                    .opacity(0)
                }
                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                .listRowSeparator(.hidden)
            }
            .navigationDestination(for: DetailModel.self, destination: { detail in
                DetailView(type: .update, model: detail)
            })
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
