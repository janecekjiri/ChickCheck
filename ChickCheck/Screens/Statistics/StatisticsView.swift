//
//  StatisticsView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

enum TimeRangeEnum {
    case sevenDays
    case forteenDays
    case thirtyDays
    
    var numValue: Int {
        switch self {
        case .sevenDays:
            7
        case .forteenDays:
            14
        case .thirtyDays:
            30
        }
    }
}

struct StatisticsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            StatisticsValueView(value: "13,8", timeRange: .sevenDays)
            
            Spacer()
                .frame(height: 20)
            
            StatisticsValueView(value: "12,3", timeRange: .forteenDays)
            
            Spacer()
                .frame(height: 20)
            
            StatisticsValueView(value: "14,6", timeRange: .thirtyDays)
            
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    StatisticsView()
}
