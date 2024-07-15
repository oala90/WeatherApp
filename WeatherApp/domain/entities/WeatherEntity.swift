//
//  Weather.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

struct WeatherEntity: Codable {
    let description: String?
    let icon: String?
    let id: Int?
    let main: String?
}
