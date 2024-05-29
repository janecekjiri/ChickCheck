//
//  DetailModel.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 29.05.2024.
//

import Foundation

typealias DetailRecord = [Date: Int]

struct DetailModel: Hashable {
    let count: Int
    let date: Date
    
    func toDetailRecord() -> DetailRecord {
        [date: count]
    }
}
