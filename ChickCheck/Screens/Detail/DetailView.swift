//
//  DetailView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct DetailView: View {
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var recordStore: RecordStore
    
    @ObservedObject private var viewModel: DetailViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            DateFormView(date: $viewModel.model.date)
            // For testing purposes
            // Text("Date is \(viewModel.model.date.formatted(.dateTime.day().month().year()))")
            
            Spacer()
                .frame(height: 20)
            
            EggsCountFormView(eggsCount: $viewModel.model.count)
            // For testing purposes
            // Text("Eggs count is \(viewModel.model.count ?? -1)")
            
            Spacer()
            
            Button(action: {
                recordStore.saveRecord(viewModel.model)
                dismiss()
            }, label: {
                Text("save")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .background(viewModel.isSaveButtonActive ? Color.green : .gray)
                    .cornerRadius(25)
            })
            .disabled(!viewModel.isSaveButtonActive)
            
            Spacer()
                .frame(height: 20)
        }
        .padding(.horizontal, 20)
        .navigationTitle(viewModel.type == .new ? "detail_screen_title_new" : "detail_screen_title_updating")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if viewModel.type == .update {
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
            } else {
                ToolbarItem(placement: .topBarLeading) {
                    Button(
                        action: {
                            dismiss()
                        },
                        label: {
                            Text("cancel")
                    })
                }
            }
        }
        .alert(
            "delete_detail_alert_title",
            isPresented: $showAlert,
            actions: {
                Button(
                    role: .destructive,
                    action: {
                        recordStore.removeRecord(self.viewModel.model)
                        dismiss()
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
                Text("delete_detail_alert_message")
            }
        )
    }
    
    init(type: DetailViewModel.DetailType, model: DetailModel? = nil) {
        self.viewModel = DetailViewModel(type: type, model: model)
    }
}

#Preview {
    DetailView(type: .new).environmentObject(RecordStore())
}
