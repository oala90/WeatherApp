//
//  WeatherRepositoryImpl.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

class WeatherRepositoryImpl: WeatherRepository {
    private let remoteDataSource: WeatherRemoteDataSource
    
    init(remoteDataSource: WeatherRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getWeatherByCityName(city: String, completion: @escaping (Result<CityEntity, Error>) -> Void) {
         remoteDataSource.getWeatherByCityName(city: city) { result in
             switch result {
             case .success(let cityDTO):
                 let cityEntity = cityDTO.toEntity()
                 completion(.success(cityEntity))
             case .failure(let error):
                 completion(.failure(error))
             }
         }
     }
}

protocol WeatherRemoteDataSource {
    func getWeatherByCityName(city: String, completion: @escaping (Result<CityDTO, Error>) -> Void)
}
