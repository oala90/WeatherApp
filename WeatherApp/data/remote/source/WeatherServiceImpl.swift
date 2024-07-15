//
//  WeatherServiceImpl.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

class WeatherServiceImpl: WeatherRemoteDataSource {
    
    private let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }

    func getWeatherByCityName(city: String, completion: @escaping (Result<CityDTO, Error>) -> Void) {
        weatherService.getWeatherByCityName(city: city, completion: completion)
    }
}

//    private let baseURL = "https://api.openweathermap.org/data/2.5/"
//    private let apiKey = "6c8a745c21f02472f186a66b96caeb44"


//        let url = baseURL
//        let parameters: [String: Any] = [
//            "q": city,
//            "appid": apiKey,
//            "country": "US",
//            "units": "imperial"
//        ]
//
//        AF.request(url, parameters: parameters).responseDecodable(of: CityDTO.self) { response in
//            switch response.result {
//            case .success(let weatherDTO):
//                completion(.success(weatherDTO))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
