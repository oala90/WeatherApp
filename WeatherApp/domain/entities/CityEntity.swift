//
//  CityDTO.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

struct CityEntity: Codable {
    let base: String?
    let  clouds: CloudsEntity?
    let  cod: Int?
    let  coord: CoordEntity?
    let  dt: Int?
    let  id: Int?
    let  main: MainEntity?
    let  name: String?
    let  sys: SysEntity?
    let  timezone: Int?
    let  visibility: Int?
    let  weather: [WeatherEntity]?
    let  wind: WindEntity?
}

