//
//  StatisticsView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct StatisticsView: View {
    private static let kSpacerHeight: CGFloat = 20
    @ObservedObject private var viewModel: StatisticsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            StatisticsValueView(value: self.viewModel.last7Days, timeRange: .sevenDays)
            
            Spacer()
                .frame(height: Self.kSpacerHeight)
            
            StatisticsValueView(value: self.viewModel.last14Days, timeRange: .forteenDays)
            
            Spacer()
                .frame(height: Self.kSpacerHeight)
            
            StatisticsValueView(value: self.viewModel.last30Days, timeRange: .thirtyDays)
            
            Spacer()
        }
        .padding(.horizontal, 10)
    }
    
    init(details: [DetailModel]) {
        self.viewModel = StatisticsViewModel(details: details)
    }
}

#Preview {
    StatisticsView(details: [])
}
