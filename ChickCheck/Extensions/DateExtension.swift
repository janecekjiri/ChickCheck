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
}
