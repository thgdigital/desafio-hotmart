//
//  DetailModel.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 23/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

// MARK: - DetailModel
class DetailModel<T : Codable>: Codable {
    let name: String
    let review: Double
    let type: LocationType
    let id: Int
    let about: String
    let schedule: T
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

struct DetailItem {
    var name: String = ""
    var review: Double = 2.0
    var type: LocationType = .barbearia
    var id: Int = 0
    var about: String = ""
    var schedule: ScheduleItem = ScheduleItem()
    var phone = ""
    var adress: String = ""
}
struct ScheduleItem {
    var sunday, monday, tuesday, wednesday: DayItem?
    var thursday, friday, saturday: DayItem?
}

struct DayItem {
    var dayOpen: String = ""
    var close: String = ""
    
    init(model: Day) {
        self.close = model.close
        self.dayOpen = model.dayOpen
    }
}
