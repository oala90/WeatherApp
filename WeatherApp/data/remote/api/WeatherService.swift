//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation
//import Alamofire

protocol WeatherService {
    func getWeatherByCityName(city: String, completion: @escaping (Result<CityDTO, Error>) -> Void)
}
