//
//  DetailModel.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 29.05.2024.
//

import Foundation

final class DetailModel: ObservableObject {
    @Published var count: Int? = nil
    @Published var date: Date = Date.now
}
