//
//  DrinkListViewModelTests.swift
//  CocktailsTests
//
//  Created by Kristina Matijasic on 02.06.2024..
//

import Foundation
import XCTest
import RxSwift
import RxBlocking
@testable import Cocktails

final class DrinkListViewModelTests: XCTestCase {

    var viewModel: DrinkListViewModel!
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
    
    func testLoading() {
        serviceMock.shouldReturnEmpty = false
        serviceMock.shouldReturnError = false
        viewModel = DrinkListViewModel(service: serviceMock, filters: nil)
        
        let contentType = try! viewModel.$contentType.asObservable().toBlocking().first()
        
        XCTAssertEqual(contentType, .loading)
    }
    
    func testFetchDrinks() {
        serviceMock.shouldReturnEmpty = false
        serviceMock.shouldReturnError = false
        viewModel = DrinkListViewModel(service: serviceMock, filters: nil)
        
        let contentType = try! viewModel.$contentType.asObservable().skip(1).toBlocking(timeout: 1).first()
        
        XCTAssertEqual(contentType, .content(drinks: drinksMock.drinks.drinks!))
    }
    
    func testFetchDrinksError() {
        serviceMock.shouldReturnEmpty = false
        serviceMock.shouldReturnError = true
        viewModel = DrinkListViewModel(service: serviceMock, filters: nil)
        
        let contentType = try! viewModel.$contentType.asObservable().skip(1).toBlocking(timeout: 1).first()
        
        XCTAssertEqual(contentType, .error)
    }
    
    func testFetchDrinksEmpty() {
        serviceMock.shouldReturnEmpty = true
        serviceMock.shouldReturnError = false
        viewModel = DrinkListViewModel(service: serviceMock, filters: nil)
        
        let contentType = try! viewModel.$contentType.asObservable().skip(1).toBlocking(timeout: 1).first()
        
        XCTAssertEqual(contentType, .empty)
    }
}
