//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation


protocol WeatherRepository {
    func getWeatherByCityName(city: String, completion: @escaping (Result<CityEntity, Error>) -> Void)
}
