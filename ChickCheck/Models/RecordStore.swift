//
//  RecordStore.swift
//  ChickCheck
//
//  Created by Jiri Janecek on 29.05.2024.
//

import Foundation

typealias DetailRecord = [String: Int]

final class RecordStore: ObservableObject {
    private static let kRecordsKey = "recordsKey"
    
    @Published var records: DetailRecord = UserDefaults.standard.object(forKey: RecordStore.kRecordsKey) as? DetailRecord ?? [:] {
        didSet {
            UserDefaults.standard.setValue(self.records, forKey: RecordStore.kRecordsKey)
        }
    }
    
    func saveRecord(_ detail: DetailModel) {
        var records = self.records
        records[detail.date.textIdentifier] = detail.count
        self.records = records
        print("Počet uložených záznamů je \(records.count)")
    }
    
    func removeRecord(_ detail: DetailModel) {
        var records = self.records
        records[detail.date.textIdentifier] = nil
        self.records = records
        print("Počet uložených záznamů je \(records.count)")
    }
    
    func removeAll() {
        self.records = [:]
    }
}

// TODO: Přesunout do vlastních souborů

extension Date {
    var textIdentifier: String {
        "\(self.timeIntervalSince1970)"
    }
}

extension String {
    var dateFromTextIdentifier: Date? {
        guard let timeIntervalSince1970 = Double(self) else { return nil }
        return Date(timeIntervalSince1970: timeIntervalSince1970)
    }
}
