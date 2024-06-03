//
//  DrinkDetailsViewModelTests.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 03.06.2024..
//

import Foundation
import XCTest
import RxSwift
import RxBlocking
@testable import Cocktails

final class DrinkDetailsViewModelTests: XCTestCase {

    var viewModel: DrinkDetailsViewModel!
    var serviceMock: ServiceMock!
    var disposeBag: DisposeBag!
    var drinksMock: DrinksMock!

    override func setUp() {
        super.setUp()
        serviceMock = ServiceMock()
        disposeBag = DisposeBag()
        drinksMock = DrinksMock()
    }

    override func tearDown() {
        viewModel = nil
        serviceMock = nil
        disposeBag = nil
        drinksMock = nil
        super.tearDown()
    }
    
    func testDrinkRandom() throws {
        serviceMock.shouldReturnEmpty = false
        serviceMock.shouldReturnError = false
        viewModel = DrinkDetailsViewModel(id: nil, service: serviceMock)
        
        let contentType = try viewModel.$contentType.asObservable().toBlocking().first()
        let randomDrink = drinksMock.randomDrink.drinks?.first
        
        XCTAssertEqual(contentType, .content(drink: randomDrink!))
    }
    
    func testFetchDrinkSelected() throws {
        serviceMock.shouldReturnEmpty = false
        serviceMock.shouldReturnError = false
        viewModel = DrinkDetailsViewModel(id: "1111", service: serviceMock)
        
        let contentType = try viewModel.$contentType.asObservable().toBlocking().first()
        let selectedDrink = drinksMock.selectedDrink.drinks?.first
        
        XCTAssertEqual(contentType, .content(drink: selectedDrink!))
    }
}
