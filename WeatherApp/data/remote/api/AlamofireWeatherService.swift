//
//  AlamofireWeatherService.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

import Alamofire

class AlamofireWeatherService: WeatherService {
    
    func getWeatherByCityName(city: String, completion: @escaping (Result<CityDTO, Error>) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather"
        let parameters: Parameters = [
            "q": city,
            "appid": "6c8a745c21f02472f186a66b96caeb44",
            "units": "metric"
        ]
        
        AF.request(url, parameters: parameters).responseDecodable(of: CityDTO.self) { response in
            switch response.result {
            case .success(let cityDTO):
                completion(.success(cityDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
