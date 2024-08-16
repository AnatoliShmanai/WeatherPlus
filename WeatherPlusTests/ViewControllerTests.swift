//
//  ViewControllerTests.swift
//  WeatherPlusTests
//
//  Created by Anatoli Shmanai on 16/08/2024.
//

import XCTest
@testable import WeatherPlus

final class ViewControllerTests: XCTestCase {

    func test_getTimeForDate1() {
        let date = Date(timeIntervalSince1970: 1300)
        let result = ViewController().getTimeForDate(date)

        XCTAssertEqual(result, "03:21")
    }

    func test_getTimeForDate2() {
        let date = Date(timeIntervalSince1970: 1400)
        let result = ViewController().getTimeForDate(date)

        XCTAssertEqual(result, "123")
    }

    func test_getTimeForDate3() {
        let date = Date(timeIntervalSince1970: 1500)
        let result = ViewController().getTimeForDate(date)

        XCTAssertEqual(result, "123")
    }
}
