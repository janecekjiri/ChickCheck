//
//  DetailView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct DetailView: View {
    @State private var showAlert = false
    @State private var isSaveButtonActive = false
    @Environment(\.dismiss) var dismiss
    
    private let viewModel: DetailViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            DateFormView()
            
            Spacer()
                .frame(height: 20)
            
            EggsCountFormView()
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("save")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 12)
            })
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 50)
            .background(isSaveButtonActive ? Color.green : .gray)
            .cornerRadius(25)
            .disabled(!isSaveButtonActive)
            
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
                        dismiss()
                        // TODO: Smaž detail
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
    
    init(type: DetailViewModel.DetailType) {
        self.viewModel = DetailViewModel(type: type)
    }
}

#Preview {
    DetailView(type: .new)
}
