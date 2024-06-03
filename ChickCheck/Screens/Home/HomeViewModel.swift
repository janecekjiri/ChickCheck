//
//  HomeViewModel.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 03.06.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var details: [DetailModel]
    
    init(details: [DetailModel]) {
        self.details = details
    }
}
