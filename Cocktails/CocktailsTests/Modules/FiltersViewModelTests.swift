//
//  FiltersViewModelTests.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 03.06.2024..
//

import Foundation
import XCTest
import RxSwift
import RxBlocking
@testable import Cocktails

final class FiltersViewModelTests: XCTestCase {

    var viewModel: FiltersViewModel!
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
    
    func testResetFilters() {
        viewModel = FiltersViewModel(service: serviceMock)
        
        viewModel.selectedCategory = drinksMock.categories.drinks?.first
        viewModel.selectedGlass = drinksMock.glass.drinks?.first
        viewModel.selectedAlcoholType = drinksMock.alcoholic.drinks?.first
        
        viewModel.resetFilters()
        
        XCTAssertNil(viewModel.selectedCategory)
        XCTAssertNil(viewModel.selectedGlass)
        XCTAssertNil(viewModel.selectedAlcoholType)
    }
    
    func testButtonsEnabled() {
        viewModel = FiltersViewModel(service: serviceMock)
        
        XCTAssertFalse(viewModel.isFilterEnabled)
        
        viewModel.selectedCategory = drinksMock.categories.drinks?.first
        XCTAssertTrue(viewModel.isFilterEnabled)
        
        viewModel.selectedCategory = nil
        viewModel.selectedGlass = drinksMock.glass.drinks?.first
        XCTAssertTrue(viewModel.isFilterEnabled)
        
        viewModel.selectedGlass = nil
        viewModel.selectedAlcoholType = drinksMock.alcoholic.drinks?.first
        XCTAssertTrue(viewModel.isFilterEnabled)
    }
    
    func testToggleSelection() {
        viewModel = FiltersViewModel(service: serviceMock)
        
        let category = drinksMock.categories.drinks?.first
        let glass = drinksMock.glass.drinks?.first
        let alcoholic = drinksMock.alcoholic.drinks?.first
        
        viewModel.toggleSelection(for: .category, item: category!)
        XCTAssertEqual(viewModel.selectedCategory, category!)
        
        viewModel.toggleSelection(for: .category, item: category!)
        XCTAssertNil(viewModel.selectedCategory)
        
        viewModel.toggleSelection(for: .glass, item: glass!)
        XCTAssertEqual(viewModel.selectedGlass, glass!)
        
        viewModel.toggleSelection(for: .glass, item: glass!)
        XCTAssertNil(viewModel.selectedGlass)
        
        viewModel.toggleSelection(for: .alcoholic, item: alcoholic!)
        XCTAssertEqual(viewModel.selectedAlcoholType, alcoholic!)
        
        viewModel.toggleSelection(for: .alcoholic, item: alcoholic!)
        XCTAssertNil(viewModel.selectedAlcoholType)
    }
    
    func testSetupBinding() throws {
        serviceMock.shouldReturnEmpty = false
        serviceMock.shouldReturnError = false
        viewModel = FiltersViewModel(service: serviceMock)
        
        let categories = drinksMock.categories.drinks
        let glasses = drinksMock.glass.drinks
        let alcoholics = drinksMock.alcoholic.drinks
        
        let contentType = try viewModel.$contentType.asObservable().toBlocking().first()
        let expectedContentType = FiltersContentType.content(
            categories: categories!,
            glasses: glasses!,
            alcoholTypes: alcoholics!
        )
        
        XCTAssertEqual(contentType, expectedContentType)
    }
}
