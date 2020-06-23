//
//  DetailModel.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

// MARK: - DetailModel
struct DetailModel: Codable {
    let name: String
    let review: Double
    let type: LocationType
    let id: Int
    let about: String
    let schedule: Schedule
    let phone, adress: String
}

// MARK: - Schedule
struct Schedule: Codable {
    let sunday, monday, tuesday, wednesday: Day?
    let thursday, friday, saturday: Day?
}

// MARK: - Day
struct Day: Codable {
    let dayOpen, close: String

    enum CodingKeys: String, CodingKey {
        case dayOpen = "open"
        case close
    }
}
