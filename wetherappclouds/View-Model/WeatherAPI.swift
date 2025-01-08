//
//  WeatherAPI.swift
//  wetherappclouds
//
//  Created by hafeez Sheik on 08/01/25.
//

import Foundation

class WeatherAPI {
    static func fetchWeather(for city: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let apiKey = "e525655f38e46b8d2a544c940e4c0274"
        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=\(apiKey)&units=metric")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "DataError", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(.success(weatherData))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
