//
//  CityMapper.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import Foundation

extension CityDTO {
    func toEntity() -> CityEntity {
        return CityEntity(
            base: base,
            clouds: clouds?.toEntity(),
            cod: cod,
            coord: coord?.toEntity(),
            dt: dt,
            id: id,
            main: main?.toEntity(),
            name: name,
            sys: sys?.toEntity(),
            timezone: timezone,
            visibility: visibility,
            weather: weather?.map { $0.toEntity() },
            wind: wind?.toEntity()
        )
    }
}

extension Clouds {
    func toEntity() -> CloudsEntity {
        return CloudsEntity(all: all)
    }
}

extension Coord {
    func toEntity() -> CoordEntity {
        return CoordEntity(lat: lat, lon: lon)
    }
}

extension Main {
    func toEntity() -> MainEntity {
        return MainEntity(
            feels_like: feels_like,
            humidity: humidity,
            pressure: pressure,
            temp: temp,
            temp_max: temp_max,
            temp_min: temp_min
        )
    }
}

extension Sys {
    func toEntity() -> SysEntity {
        return SysEntity(
            country: country,
            id: id,
            sunrise: sunrise,
            sunset: sunset,
            type: type
        )
    }
}

extension Weather {
    func toEntity() -> WeatherEntity {
        return WeatherEntity(
            description: description,
            icon: icon,
            id: id,
            main: main
        )
    }
}

extension Wind {
    func toEntity() -> WindEntity {
        return WindEntity(
            deg: deg,
            speed: speed
        )
    }
}
