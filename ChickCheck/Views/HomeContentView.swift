//
//  HomeContentView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 03.06.2024.
//

import SwiftUI

struct HomeContentView: View {
    var onAddButtonTap: (() -> Void)?
    var onAppendToPath: ((_ detail: DetailModel) -> Void)?
    var onRemoveRecord: ((_ detail: DetailModel?) -> Void)?
    
    @State private var isAlertVisible = false
    @State private var recordToDelete: DetailModel?
    @ObservedObject private var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            List(viewModel.details, id: \.date) { detail in
                ZStack(alignment: .center) {
                    RecordRowCell(count: detail.count ?? 0, date: detail.date)
                    
                    NavigationLink(value: detail) {
                        EmptyView()
                    }
                    .opacity(0)
                }
                // Row is no longer highlighted upon returning from detail screen
                // which is dismissed programatically
                .listRowBackground(Color.clear)
                .listRowInsets(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
                .listRowSeparator(.hidden)
                .contextMenu {
                    Button(
                        action: {
                            self.isAlertVisible = true
                            self.recordToDelete = detail
                        },
                        label: {
                            HStack {
                                Text("context_menu_delete")
                                Image(systemName: "trash")
                            }
                    })
                    
                    Button(
                        action: {
                            self.onAppendToPath?(detail)
                        },
                        label: {
                            ZStack {
                                HStack {
                                    Text("context_menu_edit")
                                    Image(systemName: "pencil")
                                }
                                
                                NavigationLink(value: detail) {
                                    EmptyView()
                                }
                            }
                    })
                }
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
        .alert(
            "delete_detail_alert_title",
            isPresented: self.$isAlertVisible,
            actions: {
                Button(
                    role: .destructive,
                    action: {
                        self.onRemoveRecord?(self.recordToDelete)
                        self.recordToDelete = nil
                    },
                    label: {
                        Text("yes")
                    }
                )
                
                Button(
                    role: .cancel,
                    action: {
                        self.recordToDelete = nil
                    },
                    label: {
                        Text("no")
                    }
                )
            },
            message: {
                Text("delete_detail_alert_message")
            }
        )
    }
    
    init(details: [DetailModel]) {
        self.viewModel = HomeViewModel(details: details)
    }
    
    private func makeAddButton() -> AddButton {
        var button = AddButton()
        button.onTap = onAddButtonTap
        return button
    }
}

#Preview {
    HomeContentView(details: [DetailModel()])
}
