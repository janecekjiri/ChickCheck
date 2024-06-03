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
            if self.recordStore.recordsExternal.isEmpty {
                self.makeEmptyInfoView()
                    .padding(.horizontal, 20)
            } else {
                self.makeContentView()
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
        }
        .alert(
            "delete_all_bunches_alert_title",
            isPresented: $showDeleteAlert,
            actions: {
                Button(
                    role: .destructive,
                    action: {
                        self.dismiss()
                        self.recordStore.removeAll()
                    },
                    label: {
                        Text("yes")
                })
                
                Button(
                    role: .cancel,
                    action: {
                        self.dismiss()
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
    
    private func makeEmptyInfoView() -> EmptyInfoView {
        var view = EmptyInfoView()
        view.onAddButtonTap = {
            showDetailModal = true
        }
        return view
    }
    
    private func makeContentView() -> HomeContentView {
        var content = HomeContentView(details: recordStore.recordsExternal)
        content.onAddButtonTap = {
            showDetailModal = true
        }
        return content
    }
}

#Preview {
    HomeView().environmentObject(RecordStore())
}
