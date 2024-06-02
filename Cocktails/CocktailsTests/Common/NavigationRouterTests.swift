//
//  NavigationRouterTests.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 02.06.2024..
//

import Foundation
import XCTest
@testable import Cocktails

final class NavigationRouterTests: XCTestCase {

    var router: NavigationRouter!

    override func setUp() {
        super.setUp()
        router = NavigationRouter()
    }

    override func tearDown() {
        router = nil
        super.tearDown()
    }

    func testPushRoute() {
        let route = Route.drinkDetails(id: "123")
        router.push(to: route)
        XCTAssertEqual(router.routes, [route])
    }

    func testPopRoute() {
        let route1 = Route.drinkDetails(id: "123")
        let route2 = Route.filters
        router.push(to: route1)
        router.push(to: route2)
        router.pop()
        XCTAssertEqual(router.routes, [route1])
    }

    func testPopMultipleRoutes() {
        let route1 = Route.drinkDetails(id: "123")
        let route2 = Route.filters
        let route3 = Route.drinkList(filters: nil)
        router.push(to: route1)
        router.push(to: route2)
        router.push(to: route3)
        router.pop(count: 2)
        XCTAssertEqual(router.routes, [route1])
    }
}
