//
//  DetailModel.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 29.05.2024.
//

import Foundation

final class DetailModel: Hashable, ObservableObject {
    static func == (lhs: DetailModel, rhs: DetailModel) -> Bool {
        Calendar.current.isDate(lhs.date, inSameDayAs: rhs.date)
    }
    
    /// Count of laid eggs
    @Published var count: Int? = nil
    @Published var date: Date = Date.now
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.count)
        hasher.combine(self.date)
    }
}
