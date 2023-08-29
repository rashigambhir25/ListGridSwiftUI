//
//  Data.swift
//  LIstAndGrid
//
//  Created by Rashi Gambhir on 05/07/22.
//

import Foundation

struct Details: Codable, Identifiable {
    let id = UUID()
    var name: String?
    var brand: String?
    var price: String?
    var price_sign: String?
    var image_link: String?
}
