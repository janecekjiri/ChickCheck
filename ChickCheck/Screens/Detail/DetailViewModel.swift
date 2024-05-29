//
//  DetailViewModel.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 29.05.2024.
//

import Foundation

final class DetailViewModel {
    // MARK: - Properties
    
    enum DetailType {
        /// Creating a new record
        case new
        
        /// For working with an already existing record
        case update
    }
    
    let type: DetailType
    var model: DetailModel?
    
    // MARK: - Init
    
    init(type: DetailType, model: DetailModel? = nil) {
        self.type = type
        self.model = model
    }
}
