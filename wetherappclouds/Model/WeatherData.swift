//
//  WeatherData.swift
//  wetherappclouds
//
//  Created by hafeez Sheik on 08/01/25.
//

import Foundation

struct WeatherData : Codable {
    let cod : String?
    let message : Int?
    let cnt : Int?
    let list : [WeatherList]?
    let city : City?

    enum CodingKeys: String, CodingKey {

        case cod = "cod"
        case message = "message"
        case cnt = "cnt"
        case list = "list"
        case city = "city"
    }
}



struct WeatherList : Codable {
    let dt : Int?
    let main : WeatherMain?
    let weather : [Weather]?
    let clouds : Clouds?
    let wind : Wind?
    let visibility : Int?
    let dt_txt : String?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case visibility = "visibility"
        case dt_txt = "dt_txt"
    }
}


struct City : Codable {
    let id : Int?
    let name : String?
    let coord : Coord?
    let country : String?
    let population : Int?
    let timezone : Int?
    let sunrise : Int?
    let sunset : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case coord = "coord"
        case country = "country"
        case population = "population"
        case timezone = "timezone"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}



struct Wind : Codable {
    let speed : Double?
    let deg : Int?
    let gust : Double?

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
        case gust = "gust"
    }
}






struct Clouds : Codable {
    let all : Int?
    
    enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

struct Coord : Codable {
    let lat : Double?
    let lon : Double?

    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
}





struct WeatherMain : Codable {
    let temp : Double?
    let feels_like : Double?
    let temp_min : Double?
    let temp_max : Double?
    let pressure : Int?
    let sea_level : Int?
    let grnd_level : Int?
    let humidity : Int?
    let temp_kf : Double?

    enum CodingKeys: String, CodingKey {

        case temp = "temp"
        case feels_like = "feels_like"
        case temp_min = "temp_min"
        case temp_max = "temp_max"
        case pressure = "pressure"
        case sea_level = "sea_level"
        case grnd_level = "grnd_level"
        case humidity = "humidity"
        case temp_kf = "temp_kf"
    }
}


struct Weather : Codable {
    let id : Int?
    let main : String?
    let description : String?
    let icon : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

