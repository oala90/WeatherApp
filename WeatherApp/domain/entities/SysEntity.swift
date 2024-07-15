//
//  Sys.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

struct SysEntity: Codable {
    let country: String?
    let id: Int?
    let sunrise: Int?
    let sunset: Int?
    let type: Int?
}
