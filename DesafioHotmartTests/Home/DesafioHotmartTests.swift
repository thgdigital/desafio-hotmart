//
//  HomeTests.swift
//  DesafioHotmartTests
//
//  Created by Thiago Vaz on 18/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import XCTest
@testable import DesafioHotmart

class HomeTests: XCTestCase {
    var presenter: HomePresenter!
    var view: HomeListView!
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
       
    }
    override func setUp() {
        super.setUp()
        view = HomeViewBuilder.make()
        presenter = HomePresenter(manager: ManagerMock(), with: view, route: HomeRoute())
        view.presenter = presenter
        
    }
    
    
    func testLoadata() throws {
        XCTAssertEqual(view.items.count, 0)
        presenter.fetch()
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            exp.fulfill()
            XCTAssertEqual(view.items.count, 15)
            XCTAssertEqual(presenter.viewModel.title, "")
            XCTAssertEqual(presenter.viewModel.isLoading, false)
            XCTAssertEqual(presenter.viewModel.title, "")
            XCTAssertEqual(presenter.viewModel.titleButton, "")
            XCTAssertEqual(presenter.viewModel.message, "")
            XCTAssertNotNil(view.items.first)
            let item = view.items.first!
            XCTAssertEqual(item.title, "Café Escritório")
            XCTAssertEqual(item.rewies, 3.8)
            XCTAssertEqual(item.subTitle, "Coworking")
            XCTAssertEqual(item.subTitle, LocationType.coworking.rawValue)
            XCTAssertEqual(item.image, "https://loremflickr.com/g/320/240/coworking")
            
        }
    }
    
    func testMapppingImage() throws {
        XCTAssertEqual(LocationItem.mapppingImage(type: .barbearia), "https://loremflickr.com/g/320/240/barbershop")
        XCTAssertEqual(LocationItem.mapppingImage(type: .bares), "https://loremflickr.com/g/320/240/bars")
        XCTAssertEqual(LocationItem.mapppingImage(type: .cafeteria), "https://loremflickr.com/g/320/240/coffee%20shop")
        XCTAssertEqual(LocationItem.mapppingImage(type: .coworking), "https://loremflickr.com/g/320/240/coworking")
        XCTAssertEqual(LocationItem.mapppingImage(type: .padaria), "https://loremflickr.com/g/320/240/bakehouse")
        XCTAssertEqual(LocationItem.mapppingImage(type: .produtosNaturais), "https://loremflickr.com/g/320/240/Natural%20products")
        XCTAssertEqual(LocationItem.mapppingImage(type: .restaurante), "https://loremflickr.com/g/320/240/restaurant")
        XCTAssertEqual(LocationItem.mapppingImage(type: .sucosNaturais), "https://loremflickr.com/g/320/240/natural%20juices")
        XCTAssertEqual(LocationItem.mapppingImage(type: .supermercado), "https://loremflickr.com/g/320/240/supermarket")
    }
    
    func testMappingModel() throws {
        guard let locations: Locations = Loader.mock(file: "Locations") else {
            XCTFail("Json não existe")
            return
        }
        XCTAssertNotNil(locations.listLocations.last)
        let item = LocationItem.mapping(model: locations.listLocations.last!, index: 14)
        XCTAssertEqual(item.title, "BBQ Pit House")
        XCTAssertEqual(item.rewies, 1.0)
        XCTAssertEqual(item.subTitle, "Restaurante")
        XCTAssertEqual(item.subTitle, LocationType.restaurante.rawValue)
        XCTAssertEqual(item.image, "https://loremflickr.com/g/320/240/restaurant")
    }
    
    func testRoute() throws{
        let route = HomeRoute()
        XCTAssertNil(route.viewController)
        XCTAssertEqual(route.makeScreen().topViewController!, route.viewController)
        
    }
}
