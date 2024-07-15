//
//  BaseUseCase.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/16/24.
//

import Foundation

class BaseUseCase<Input, Output>: UseCase {
    func execute(_ input: Input?, completion: @escaping (Result<Output, Error>) -> Void) {
        fatalError("Execute method must be overridden")
    }
}
