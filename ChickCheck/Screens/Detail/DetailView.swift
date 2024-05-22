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
    
    var body: some View {
        NavigationStack {
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
                .background(Color.green)
                .cornerRadius(25)
                
                Spacer()
                    .frame(height: 20)
            }
            .padding(.horizontal, 20)
            // TODO: Upravit titulek na "Vytvořit záznam" a "Upravit záznam"
            .navigationTitle("detail_screen_title")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // TODO: Zobraz detail pouze, pokud jde o úpravu, nikoliv vytvoření záznamu
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
}

#Preview {
    DetailView()
}
