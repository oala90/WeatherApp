//
//  GetWeatherByCityUseCase.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/16/24.
//

import Foundation

class GetWeatherByCityUseCase: BaseUseCase<String, CityEntity> {
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }

    override func execute(_ input: String?, completion: @escaping (Result<CityEntity, Error>) -> Void) {
        guard let city = input else {
            completion(.failure(NSError(domain: "InputError", code: -1, userInfo: [NSLocalizedDescriptionKey: "City name is required"])))
            return
        }

        weatherRepository.getWeatherByCityName(city: city) { result in
            completion(result)
        }
    }
}
