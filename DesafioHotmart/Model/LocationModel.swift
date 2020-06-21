//
//  LocationModel.swift
//  DesafioHotmart
//
//  Created by Thiago Vaz on 19/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import Foundation

// MARK: - Locations
struct Locations: Codable {
    let listLocations: [LocationModel]
}

// MARK: - LocationModel
struct LocationModel: Codable {
    let name: String
    let review: Double
    let type: LocationType
    let id: Int
}
enum LocationType: String, Codable {
    case coworking = "Coworking"
    case restaurante = "Restaurante"
    case padaria = "Padaria"
    case sucosNaturais = "Sucos Naturais"
    case cafeteria = "Cafeteria"
    case produtosNaturais = "Produtos naturais"
    case barbearia = "Barbearia"
    case supermercado = "Supermercado"
    case bares = "Bares"
}
