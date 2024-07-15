//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/16/24.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    @Published var searchCity: String = ""
    @Published var cityWeather: CityEntity?
    
    private let getWeatherByCityUseCase: GetWeatherByCityUseCase
    
    init(getWeatherByCityUseCase: GetWeatherByCityUseCase) {
        self.getWeatherByCityUseCase = getWeatherByCityUseCase
    }
    
    func getWeatherByCity(city: String) {
        getWeatherByCityUseCase.execute(city) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let cityEntity):
                    self?.cityWeather = cityEntity
                case .failure:
                    self?.cityWeather = nil
                }
            }
        }
    }
}
