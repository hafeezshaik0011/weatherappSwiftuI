//
//  WeatherInfoView.swift
//  wetherappclouds
//
//  Created by hafeez Sheik on 08/01/25.
//

import SwiftUI


struct WeatherInfoView: View {
    var systemImage: String
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: systemImage)
                    .foregroundColor(.gray)
                    .frame(width: 20, height: 20)
                    .padding(.leading, 8)
                
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.trailing, 8)
            }
            .frame(width: 120, height: 30)
            .background(Color.white)
            .cornerRadius(15)

            Text(value)
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct Gridview: View {
    
    var cityName: String
    
    var forecast: [WeatherList] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title showing the city name that was searched
            Text("Weather Details for \(cityName)")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            ScrollView(.horizontal) {  // Enable horizontal scrolling
                LazyHGrid(rows: [GridItem(.fixed(100))], spacing: 10) {
                    ForEach(forecast, id: \.dt) { weather in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Temp : \(String(format: "%.2f", weather.main?.temp ?? 0))°C")
                                Text("Sea Level : \(String(format: "%.2f", weather.main?.sea_level ?? 0)) m")
                                Text("Ground Level : \(String(format: "%.2f", weather.main?.grnd_level ?? 0)) m")
                                Text("Weather : \(weather.weather?[0].description ?? "")")
                                Text("\(weather.dt_txt ?? "")")
                            }
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            
                            if let icon = weather.weather?.first?.icon {
                                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .frame(width: 240, height: 150)
                    }
                }
                .padding(.bottom)
            }
            .frame(height: 150)
        }
        
        .padding()
        .frame(width: UIScreen.main.bounds.width - 20)
        
        .shadow(radius: 5)
        .background(Color.white.opacity(0.5))
        .cornerRadius(10)
    }
}


