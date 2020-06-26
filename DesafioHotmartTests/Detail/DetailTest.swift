//
//  DetailTest.swift
//  DesafioHotmartTests
//
//  Created by Thiago Vaz on 26/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import XCTest
@testable import DesafioHotmart

class DetailTest: XCTestCase {
    var presenter: DetailPresenter!
    var view: DetailViewController!
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        view = nil
        
    }
    override func setUp() {
        super.setUp()
        view = DetailViewControllerBuilder.makeScreen()
        presenter = DetailPresenter(idLocation: 1, manager: ManagerMock(), view: view)
        view.presenter = presenter
    }
    
    func testDataInfos() {
        let infos = presenter.dataInfos(phone: "", adress: "")
        XCTAssertEqual(infos.count, 3)
        XCTAssertEqual(infos[0].text, "seg a sex: 7h às 23h \n sáb e dom: 8h às 20h")
        XCTAssertEqual(infos[0].image, "time")
        
    }
    
    func testDataReviews() {
        let reviews = presenter.dataReviews()
        XCTAssertEqual(reviews.count, 3)
        XCTAssertNotNil(reviews.first)
        if let reviewsFirst = reviews.first {
            XCTAssertEqual(reviewsFirst.adress, "Tomás Montenegro, Belo Horizonte - MG")
            XCTAssertEqual(reviewsFirst.avatar, "https://loremflickr.com/g/320/240/people")
            XCTAssertEqual(reviewsFirst.rating, 5.0)
            XCTAssertEqual(reviewsFirst.subTitle, "Tortas deliciosas. Os waffles também estavam muito bons. Equipe muito atenciosa. :)")
            XCTAssertEqual(reviewsFirst.title, "Fantástico!!")
        }
    }
    
    func testData() {
        presenter.fetchLocation()
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            exp.fulfill()
            XCTAssertEqual(view.sections.count, 5)
            XCTAssert(view.sections[0].items.count == 1)
            if let item = view.sections.first?.items.first as? HeaderItem {
                XCTAssertEqual(item.name, "Café Escritório")
                XCTAssertEqual(item.image, "https://loremflickr.com/g/320/240/coworking")
                XCTAssertEqual(item.review, 3.8)
            }
           
        }
    }
}
