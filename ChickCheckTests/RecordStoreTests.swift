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
        super.tearDown()
    }

}
