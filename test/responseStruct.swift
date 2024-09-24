//  responseStruct.swift
//  test
//
//  Created by Victor Garcia on 20/09/24.
//

import Foundation

public struct responseStruct: Codable {
    
    public let coord: Coord
    public let weather: [Weather]
    public let base: String
    public let main: Main
    public let visibility: Int
    public let wind: Wind
    public let clouds: Clouds
    public let dt: Int
    public let sys: Sys
    public let timezone: Int
    public let id: Int
    public let name: String
    public let cod: Int

    public init(coord: Coord, weather: [Weather], base: String, main: Main, visibility: Int, wind: Wind, clouds: Clouds, dt: Int, sys: Sys, timezone: Int, id: Int, name: String, cod: Int) {
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
}

public struct Coord: Codable {
    public let lon: Double
    public let lat: Double
    
    // Inicializador público
    public init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }
}

public struct Weather: Codable {
    public let id: Int
    
    // Inicializador público
    public init(id: Int) {
        self.id = id
    }
}

public struct Main: Codable {
    public let temp: Double
    public let feelsLike: Double
    public let tempMin: Double
    public let tempMax: Double
    public let pressure: Int
    public let humidity: Int
    public let seaLevel: Int
    public let grndLevel: Int
    
    public init(temp: Double, feelsLike: Double, tempMin: Double, tempMax: Double, pressure: Int, humidity: Int, seaLevel: Int, grndLevel: Int) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
        self.seaLevel = seaLevel
        self.grndLevel = grndLevel
    }
    
    // Claves para el json
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

public struct Wind: Codable {
    public let speed: Double
    public let deg: Int
    
    public init(speed: Double, deg: Int) {
        self.speed = speed
        self.deg = deg
    }
}

public struct Clouds: Codable {
    public let all: Int
    
    public init(all: Int) {
        self.all = all
    }
}

public struct Sys: Codable {
    public let type: Int
    public let id: Int
    public let country: String
    public let sunrise: Int
    public let sunset: Int
    
    public init(type: Int, id: Int, country: String, sunrise: Int, sunset: Int) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

