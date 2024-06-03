//
//  RecordStore.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 29.05.2024.
//

import Foundation

typealias DetailRecord = [String: Int]

final class RecordStore: ObservableObject {
    // MARK: - Properties
    
    private static let kRecordsKey = "recordsKey"
    
    @Published var recordsExternal: [DetailModel] = []
    
    private var records: DetailRecord = UserDefaults.standard.object(forKey: RecordStore.kRecordsKey) as? DetailRecord ?? [:] {
        didSet {
            self.convertRecordsIntoDetails()
            UserDefaults.standard.setValue(self.records, forKey: RecordStore.kRecordsKey)
        }
    }
    
    // MARK: - Init
    
    init() {
        self.convertRecordsIntoDetails()
    }
    
    // MARK: - Methods
    
    func saveRecord(_ detail: DetailModel) {
        var records = self.records
        detail.date = detail.date.setDateToMidnight()
        records[detail.date.textIdentifier] = detail.count
        self.records = records
    }
    
    func removeRecord(_ detail: DetailModel) {
        var records = self.records
        records[detail.date.textIdentifier] = nil
        self.records = records
    }
    
    func removeAll() {
        self.records = [:]
    }
    
    private func convertRecordsIntoDetails() {
        var details: [DetailModel] = []
        for record in self.records {
            guard let date = record.key.dateFromTextIdentifier else { continue }
            let detail = DetailModel()
            detail.date = date
            detail.count = record.value
            details.append(detail)
        }
        details.sort { $0.date > $1.date }
        self.recordsExternal = details
    }
}
