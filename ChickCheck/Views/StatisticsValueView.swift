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
    
    var body: some View {
        Text(value)
            .font(.system(size: 50))
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        
        Text("průměrná snůška za posledních \(timeRange.numValue) dní")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundStyle(Color(.systemGray2))
    }
    
    init(value: String, timeRange: TimeRangeEnum) {
        self.value = value
        self.timeRange = timeRange
    }
}

#Preview {
    StatisticsValueView(value: "13,6", timeRange: .sevenDays)
}
