//
//  ManagerMock.swift
//  DesafioHotmartTests
//
//  Created by Thiago Vaz on 25/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation
@testable import DesafioHotmart

class ManagerMock: LocationManager {
    
    override func fetch(completionHandler: @escaping (Result<Locations, NetworkError>) -> Void) {
        guard let locations: Locations = Loader.mock(file: "Locations") else {
            completionHandler(.failure(.jsonDecoding))
            return
        }
        completionHandler(.success(locations))
    }
    
    override func findLocation(id: Int, completionHandler: @escaping (Result<DetailItem, NetworkError>) -> Void) {
        var item = DetailItem()
        if let location: DetailModel<Schedule> = Loader.mock(file: "DetailModel") {
            item = self.mappingLocationDetail(location: location)
            item.schedule = self.mappingSchedule(data: location.schedule)
            completionHandler(.success(item))
        } else if let location: DetailModel<[Schedule]> = Loader.mock(file: "DetailModel") {
            item = self.mappingLocationDetail(location: location)
            if let schedule = location.schedule.first {
                item.schedule = self.mappingSchedule(data: schedule)
            }
            completionHandler(.success(item))
        } else {
            completionHandler(.failure(.jsonDecoding))
        }
    }
}
