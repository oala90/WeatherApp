//
//  DIContainer.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

class DIContainer {
    static let shared = DIContainer()
    
    private init() {}
    
    func provideWeatherService() -> WeatherService {
        return AlamofireWeatherService()
    }
    
    func provideWeatherRemoteDataSource() -> WeatherRemoteDataSource {
        let weatherService = provideWeatherService()
        return WeatherServiceImpl(weatherService: weatherService)
    }
    
    func provideWeatherRepository() -> WeatherRepository {
        let remoteDataSource = provideWeatherRemoteDataSource()
        return WeatherRepositoryImpl(remoteDataSource: remoteDataSource)
    }
    
    func provideGetWeatherByCityUseCase() -> GetWeatherByCityUseCase {
        let weatherRepository = provideWeatherRepository()
        return GetWeatherByCityUseCase(weatherRepository: weatherRepository)
    }
    
    func provideWeatherViewModel() -> WeatherViewModel {
        let getWeatherByCityUseCase = provideGetWeatherByCityUseCase()
        return WeatherViewModel(getWeatherByCityUseCase: getWeatherByCityUseCase)
    }
}

