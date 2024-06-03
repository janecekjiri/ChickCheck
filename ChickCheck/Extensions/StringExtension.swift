//
//  StringExtension.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 03.06.2024.
//

import Foundation

extension String {
    var dateFromTextIdentifier: Date? {
        guard let timeIntervalSince1970 = Double(self) else { return nil }
        return Date(timeIntervalSince1970: timeIntervalSince1970)
    }
}
