//
//  StatisticsValueView.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 15.05.2024.
//

import SwiftUI

struct StatisticsValueView: View {
    private var value: String
    private var timeRange: TimeRangeEnum
    @ScaledMetric(relativeTo: .title2) var titleSize = 50.0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(verbatim: self.value)
                    .font(.system(size: self.titleSize))
                    .fontWeight(.bold)
                
                Spacer()
            }
            
            HStack {
                Text("\(self.timeRange.numValue) average_bunch")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.systemGray2))
                
                Spacer()
            }
        }
        .accessibilityElement()
        .accessibilityLabel("\(self.value) \(self.timeRange.numValue) statistics value ")
    }
    
    init(value: String, timeRange: TimeRangeEnum) {
        self.value = value
        self.timeRange = timeRange
    }
}

#Preview {
    StatisticsValueView(value: "13.6", timeRange: .sevenDays)
}
