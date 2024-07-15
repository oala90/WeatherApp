//
//  CityDTO.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

struct CityDTO: Codable {
    let base: String?
    let  clouds: Clouds?
    let  cod: Int?
    let  coord: Coord?
    let  dt: Int?
    let  id: Int?
    let  main: Main?
    let  name: String?
    let  sys: Sys?
    let  timezone: Int?
    let  visibility: Int?
    let  weather: [Weather]?
    let  wind: Wind?
}

