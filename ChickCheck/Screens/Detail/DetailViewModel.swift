//
//  DetailViewModel.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 29.05.2024.
//

import Combine
import Foundation

final class DetailViewModel: ObservableObject {
    // MARK: - Properties
    
    enum DetailType {
        /// Creating a new record
        case new
        
        /// For working with an already existing record
        case update
    }
    
    let type: DetailType
    @Published var model: DetailModel
    @Published var isSaveButtonActive = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    // MARK: - Init
    
    init(type: DetailType, model: DetailModel? = nil) {
        self.type = type
        self.model = model ?? DetailModel()
        
        self.model.$count
            .receive(on: RunLoop.main)
            .map { count in
                return count != nil
            }
            .assign(to: \.isSaveButtonActive, on: self)
            .store(in: &cancellableSet)
    }
}
