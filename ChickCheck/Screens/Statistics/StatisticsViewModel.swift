//
//  StatisticsViewModel.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 03.06.2024.
//

import Foundation

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

final class StatisticsViewModel: ObservableObject {
    @Published var last7Days = ""
    @Published var last14Days = ""
    @Published var last30Days = ""
    
    private let details: [DetailModel]
    
    init(details: [DetailModel]) {
        self.details = details
        self.calculateAverages()
    }
    
    private func calculateAverages() {
        self.calculateAverageFor(.sevenDays)
        self.calculateAverageFor(.forteenDays)
        self.calculateAverageFor(.thirtyDays)
    }
    
    private func calculateAverageFor(_ timeRange: TimeRangeEnum) {
        let today = Date.now
        let calendar = Calendar.current
        
        /// Total count of laid eggs
        var count: Int = 0
        /// Count of days which had recorded laid eggs
        var days: Double = 0.0
        
        for index in 0...timeRange.numValue-1 {
            if let date = calendar.date(byAdding: .day, value: -index, to: today),
               let detail = self.details.first(where: { calendar.isDate(date, inSameDayAs: $0.date) }) {
                count += detail.count ?? 0
                days += 1.0
            }
        }
        
        let average: Double = days.isZero ? 0 : ((Double(count) / days) * 10).rounded() / 10
        let stringAverage = String(format: "%.1f", average)
        
        switch timeRange {
        case .sevenDays:
            self.last7Days = stringAverage
        case .forteenDays:
            self.last14Days = stringAverage
        case .thirtyDays:
            self.last30Days = stringAverage
        }
    }
}
