//
//  DetailView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var recordStore: RecordStore
    
    @State private var showAlert = false
    @ObservedObject private var viewModel: DetailViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            DateFormView(date: self.$viewModel.model.date)
            // For testing purposes
            // Text("Date is \(viewModel.model.date.formatted(.dateTime.day().month().year()))")
            
            Spacer()
                .frame(height: 20)
            
            EggsCountFormView(eggsCount: self.$viewModel.model.count)
            // For testing purposes
            // Text("Eggs count is \(viewModel.model.count ?? -1)")
            
            Spacer()
            
            Button(action: {
                self.recordStore.saveRecord(viewModel.model)
                self.dismiss()
            }, label: {
                Text("save")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .background(self.viewModel.isSaveButtonActive ? Color.green : .gray)
                    .cornerRadius(25)
            })
            .disabled(!self.viewModel.isSaveButtonActive)
            
            Spacer()
                .frame(height: 20)
        }
        .padding(.horizontal, 20)
        .navigationTitle(self.viewModel.type == .new ? "detail_screen_title_new" : "detail_screen_title_updating")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if self.viewModel.type == .update {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: {
                            self.showAlert = true
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
                            self.dismiss()
                        },
                        label: {
                            Text("cancel")
                    })
                }
            }
        }
        .alert(
            "delete_detail_alert_title",
            isPresented: self.$showAlert,
            actions: {
                Button(
                    role: .destructive,
                    action: {
                        self.recordStore.removeRecord(self.viewModel.model)
                        self.dismiss()
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
