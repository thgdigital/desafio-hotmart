//
//  LocationsRoute.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Alamofire

enum LocationsRoute: URLRequestConvertible {
    static let baseURLString = "https://hotmart-mobile-app.herokuapp.com"
    case getLocations
    case location(id: Int)
    func asURLRequest() throws -> URLRequest {
        let url = try LocationsRoute.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
    var method: HTTPMethod {
        switch self {
        case .getLocations, .location:
            return .get
        }
    }
    var path: String {
        switch self {
        case .getLocations:
            return "/locations"
        case .location(let id):
            return "locations/\(id)"
        }
        
    }
}
