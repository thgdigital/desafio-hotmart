//
//  LocationManager.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation
import Alamofire

class LocationManager {
    
    @discardableResult
    private func performRequest(route: LocationsRoute, completion: @escaping (AFDataResponse<Any>) -> Void) -> DataRequest {
        return AF.request(route).responseJSON {response in
            completion(response)
        }
    }
    
    func fetch(completionHandler: @escaping  (Result<Locations, NetworkError>)-> Void) {
        performRequest(route: .getLocations) { response in
            switch response.result {
                
            case .success:
                
                guard let data = response.data, let locations: Locations = self.decodeParse(jsonData: data) else {
                    completionHandler(.failure(.jsonDecoding))
                    return
                }
                completionHandler(.success(locations))
            case .failure(let error):
                if let nsError = error.underlyingError as? NSError, nsError.code ==  NSURLErrorNotConnectedToInternet {
                    completionHandler(.failure(.noConnection))
                    
    
                    
                }else{
                    completionHandler(.failure(.http(statusCode: error._code, rawResponseData: response.data ?? Data())))
                }
                
            }
        }
    }
    
    func findLocation(id: Int, completionHandler: @escaping  (Result<DetailItem, AFError>)-> Void){
        performRequest(route: .location(id: id)) { response in
            switch response.result {
                
            case .success:
                guard let data = response.data else {
                    return
                }
                var item = DetailItem()
                
                if let location: DetailModel<Schedule> = self.decodeParse(jsonData: data) {
                    item = self.mappingLocationDetail(location: location)
                    item.schedule = self.mappingSchedule(data: location.schedule)
                } else if let location: DetailModel<[Schedule]> = self.decodeParse(jsonData: data) {
                    item = self.mappingLocationDetail(location: location)
                    if let schedule = location.schedule.first {
                        item.schedule = self.mappingSchedule(data: schedule)
                    }
                }
                //                completionHandler(.failure(AFError.))
                completionHandler(.success(item))
                
            case .failure(let error):
                print((error.underlyingError as? NSError)?.code == NSURLErrorNotConnectedToInternet)
            }
        }
        
    }
    func mappingLocationDetail<T : Codable>(location: DetailModel<T>) -> DetailItem {
        var item = DetailItem()
        item.about = location.about
        item.phone = location.phone
        item.adress = location.adress
        item.name = location.name
        item.id = location.id
        item.review = location.review
        item.type = location.type
        return item
    }
    
    func mappingSchedule(data: Schedule) -> ScheduleItem {
        
        var item = ScheduleItem()
        if let friday = data.friday {
            item.friday = DayItem(model: friday)
        }
        if let monday = data.monday {
            item.monday = DayItem(model: monday)
        }
        if let saturday = data.saturday {
            item.saturday = DayItem(model: saturday)
        }
        if let sunday = data.sunday {
            item.sunday = DayItem(model: sunday)
        }
        if let thursday = data.thursday {
            item.thursday = DayItem(model: thursday)
        }
        if let tuesday = data.tuesday {
            item.tuesday = DayItem(model: tuesday)
        }
        if let wednesday = data.wednesday {
            item.wednesday = DayItem(model: wednesday)
        }
        
        return item
    }
    
    fileprivate func decodeParse<T: Codable>(jsonData: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            let items = try decoder.decode(T.self, from: jsonData)
            return items
        } catch {
            return nil
        }
    }
}
