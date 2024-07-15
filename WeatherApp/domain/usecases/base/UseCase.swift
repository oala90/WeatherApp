//
//  Response.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/16/24.
//

import Foundation

protocol UseCase {
    associatedtype Input
    associatedtype Output

    func execute(_ input: Input?, completion: @escaping (Result<Output, Error>) -> Void)
}
