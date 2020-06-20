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
           return AF.request(route).validate().responseJSON {response in
               completion(response)
           }
       }
    
    func fetch(completionHandler: @escaping  (Result<Locations, AFError>)-> Void) {
        performRequest(route: .getLocations) { response in
            switch response.result {
                
            case .success:
                
                guard let data = response.data, let locations: Locations = self.decodeParse(jsonData: data) else {
                    return
                }
                completionHandler(.success(locations))
            case .failure(let error):
                print(error)
            }
        }
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
