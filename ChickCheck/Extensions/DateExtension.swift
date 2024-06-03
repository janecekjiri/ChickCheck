//
//  DateExtension.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 03.06.2024.
//

import Foundation

extension Date {
    var textIdentifier: String {
        "\(self.timeIntervalSince1970)"
    }
    
    func setDateToMidnight() -> Date {
        if let newDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self) {
            return newDate
        }
        return self
    }
}
