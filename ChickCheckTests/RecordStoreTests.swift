//
//  RecordStoreTests.swift
//  ChickCheckTests
//
//  Created by Jiri Janecek on 07.06.2024.
//

import XCTest
@testable import ChickCheck

final class RecordStoreTests: XCTestCase {

    var sut: RecordStore!
    
    override func setUp() {
        super.setUp()
        self.sut = RecordStore()
    }
    
    override func tearDown() {
        self.sut = nil
        UserDefaults.standard.setValue(nil, forKey: "recordsKey")
        super.tearDown()
    }
    
    func testWhenInitialized_areRecordsEmpty() {
        XCTAssertEqual(self.sut.recordsExternal.count, 0)
    }
    
    func testWhenSavedRecord_isThereOneRecord() {
        let detail = DetailModel()
        detail.count = 15
        sut.saveRecord(detail)
        XCTAssertEqual(sut.recordsExternal.count, 1)
    }
    
    func testWhenRemovedRecods_areRecordsEmpty() {
        let detail = DetailModel()
        detail.count = 15
        sut.saveRecord(detail)
        sut.removeRecord(detail)
        XCTAssertEqual(sut.recordsExternal.count, 0)
    }
    
    func testWhenSavingRecordWithAlreadySavedDate_isNumberOfRecordsSame() {
        let detail1 = self.makeDetail(count: 15, daysAgo: 0)
        let detail2 = self.makeDetail(count: 10, daysAgo: 1)
        let detail3 = self.makeDetail(count: 9, daysAgo: 0)
        sut.saveRecord(detail1)
        sut.saveRecord(detail2)
        sut.saveRecord(detail3)
        XCTAssertEqual(sut.recordsExternal.count, 2)
    }
    
    func testWhenAllRecordsAreRemoved_areRecordsEmpty() {
        let detail1 = self.makeDetail(count: 15, daysAgo: 0)
        let detail2 = self.makeDetail(count: 10, daysAgo: 1)
        let detail3 = self.makeDetail(count: 9, daysAgo: 2)
        sut.saveRecord(detail1)
        sut.saveRecord(detail2)
        sut.saveRecord(detail3)
        sut.removeAll()
        XCTAssertEqual(sut.recordsExternal.count, 0)
    }
    
    func testWhenSavingRecordWithAlreadySavedDate_isOldRecordUpdated() {
        let detail1 = self.makeDetail(count: 15, daysAgo: 0)
        let detail2 = self.makeDetail(count: 10, daysAgo: 1)
        let detail3 = self.makeDetail(count: 9, daysAgo: 0)
        sut.saveRecord(detail1)
        sut.saveRecord(detail2)
        sut.saveRecord(detail3)
        XCTAssertEqual(sut.recordsExternal[0].count, 9)
    }
    
    private func makeDetail(count: Int, daysAgo: Int) -> DetailModel {
        let detail = DetailModel()
        detail.count = count
        detail.date = Calendar.current.date(byAdding: .day, value: -daysAgo, to: Date.now) ?? Date.now
        return detail
    }

}
