//
//  HomeView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recordStore: RecordStore
    @Environment(\.dismiss) var dismiss
    
    @State private var isDeleteAlertVisible = false
    @State private var isDetailModalVisible = false
    
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
                                    self.isDeleteAlertVisible = true
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
            isPresented: self.$isDeleteAlertVisible,
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
                    action: {},
                    label: {
                        Text("no")
                    }
                )
            },
            message: {
                Text("delete_all_bunches_alert_message")
            }
        )
        .sheet(isPresented: self.$isDetailModalVisible, content: {
            NavigationStack {
                DetailView(type: .new)
            }
        })
    }
    
    private func makeEmptyInfoView() -> EmptyInfoView {
        var view = EmptyInfoView()
        view.onAddButtonTap = {
            isDetailModalVisible = true
        }
        return view
    }
    
    private func makeContentView() -> HomeContentView {
        var content = HomeContentView(details: recordStore.recordsExternal)
        content.onAddButtonTap = {
            isDetailModalVisible = true
        }
        return content
    }
}

#Preview {
    HomeView().environmentObject(RecordStore())
}
