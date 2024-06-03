//
//  HomeContentView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 03.06.2024.
//

import SwiftUI

struct HomeContentView: View {
    @ObservedObject private var viewModel: HomeViewModel
    
    var onAddButtonTap: (() -> Void)?
    
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
                // which I dismissed programatically
                .listRowBackground(Color.clear)
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
    
    init(details: [DetailModel]) {
        self.viewModel = HomeViewModel(details: details)
    }
    
    private func makeAddButton() -> AddButton {
        var button = AddButton()
        button.onTap = onAddButtonTap
        return button
    }
}
