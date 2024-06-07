//
//  StatisticsViewModelTests.swift
//  ChickCheckTests
//
//  Created by Jiri Janecek on 07.06.2024.
//

import XCTest
@testable import ChickCheck

final class StatisticsViewModelTests: XCTestCase {
    // Methods setUp and tearDown are not needed
    
    // MARK: - Tests
    
    // MARK: No records
    
    func test_whenNoRecords_is7DayAverageZero() {
        let sut = StatisticsViewModel(details: [])
        XCTAssertEqual(sut.last7Days, "0.0")
    }
    
    func test_whenNoRecords_is14DayAverageZero() {
        let sut = StatisticsViewModel(details: [])
        XCTAssertEqual(sut.last14Days, "0.0")
    }
    
    func test_whenNoRecords_is30DayAverageZero() {
        let sut = StatisticsViewModel(details: [])
        XCTAssertEqual(sut.last30Days, "0.0")
    }
    
    // MARK: Some records
    
    func testLast7Days_whenRecordsExist() {
        let sut = StatisticsViewModel(details: self.makeDetails1())
        XCTAssertEqual(sut.last7Days, "12.5")
    }
    
    func testLast14Days_whenRecordsExist() {
        let sut = StatisticsViewModel(details: self.makeDetails1())
        XCTAssertEqual(sut.last14Days, "8.3")
    }
    
    func testLast30Days_whenRecordsExist() {
        let sut = StatisticsViewModel(details: self.makeDetails1())
        XCTAssertEqual(sut.last30Days, "18.3")
    }
    
    func testLast7Days_when7RecordsExist() {
        let sut = StatisticsViewModel(details: self.makeDetails2())
        XCTAssertEqual(sut.last7Days, "13.3")
    }
    
    // MARK: - Helper methods
    
    private func makeDetails1() -> [DetailModel] {
        [
            self.makeDetail(count: 15, daysAgo: 0),
            self.makeDetail(count: 10, daysAgo: 1),
            self.makeDetail(count: 0, daysAgo: 10),
            self.makeDetail(count: 48, daysAgo: 20)
        ]
    }
    
    private func makeDetails2() -> [DetailModel] {
        [
            self.makeDetail(count: 15, daysAgo: 0),
            self.makeDetail(count: 10, daysAgo: 1),
            self.makeDetail(count: 3, daysAgo: 2),
            self.makeDetail(count: 17, daysAgo: 3),
            self.makeDetail(count: 7, daysAgo: 4),
            self.makeDetail(count: 19, daysAgo: 5),
            self.makeDetail(count: 22, daysAgo: 6)
        ]
    }
    
    private func makeDetail(count: Int, daysAgo: Int) -> DetailModel {
        let detail = DetailModel()
        detail.count = count
        detail.date = Calendar.current.date(byAdding: .day, value: -daysAgo, to: Date.now) ?? Date.now
        return detail
    }
}
