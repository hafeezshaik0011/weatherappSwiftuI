//
//  WeatherHeaderView.swift
//  wetherappclouds
//
//  Created by hafeez Sheik on 08/01/25.
//

import SwiftUI

struct WeatherHeaderView: View {
    
    @State private var currentDate: String = ""
    @State private var currentTime: String = ""
    
    @StateObject private var locationManager = LocationManager()
    
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    @State private var icon: String = ""
    
    
    @State private var currentWeather: WeatherList?
    @State private var forecast: [WeatherList] = []
    
    
    @State private var currentcityName: String = ""
    @State private var cityName: String = ""
    @State private var showAlert: Bool = false

    
    fileprivate func getcityweatherbutton() -> Button<some View> {
        return Button(action: {
            fetchselectedWeatherData(for: cityName)
        }) {
            Text("Get Weather")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
        }
    }
    
    
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                ScrollView(.vertical) {
                    Text("Weather App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    HStack {
                        currentInfotile(currentTime: currentTime,
                                        currentDate: currentDate,
                                        city: locationManager.cityName,
                                        icon: icon)
                        
                        VStack {
                            WeatherInfoView(
                                systemImage: "wind",
                                title: "Wind",
                                value: "\(String(format: "%.2f", currentWeather?.wind?.speed ?? 0)) km/h"
                            )
                            WeatherInfoView(
                                systemImage: "drop.fill",
                                title: "Humidity",
                                value: "\(currentWeather?.main?.humidity ?? 0) %"
                            )
                        }
                        .padding()
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .frame(width: 140)
                    }
                    .padding()
                    
                    SearchBarView(cityName: $cityName)
                    
                    getcityweatherbutton()
                    
                    if !cityName.isEmpty {
                        if !forecast.isEmpty{
                            Gridview(cityName: cityName,forecast: forecast)
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            updateDateTime()
            locationManager.requestLocation()
        }
        .onChange(of: locationManager.cityName, {
            if !locationManager.cityName.isEmpty {
                currentcityName = locationManager.cityName
                print("currentcityName : \(currentcityName)")
                fetchcurrentWeatherData(for: currentcityName)
            }
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage ?? "Something went wrong."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func updateDateTime() {
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .long
        timeFormatter.timeStyle = .short
        
        let now = Date()
        currentDate = dateFormatter.string(from: now)
        currentTime = timeFormatter.string(from: now)
    }
    
    
    func fetchcurrentWeatherData(for city: String) {
        isLoading = true
        errorMessage = nil
        
        WeatherAPI.fetchWeather(for: city) { result in
            isLoading = false
            switch result {
            case .success(let data):
                currentWeather = data.list?[0]
                icon = currentWeather?.weather?[0].icon ?? ""
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
    
    func fetchselectedWeatherData(for city: String) {
        isLoading = true
        errorMessage = nil
        
        WeatherAPI.fetchWeather(for: city) { result in
            isLoading = false
            switch result {
            case .success(let data):
                forecast = data.list ?? []
                print("Sucess")
            case .failure(let error):
                errorMessage = error.localizedDescription
                print("failure")
                forecast =  []
                showAlert = true
            }
        }
    }
    
    
}

#Preview {
    WeatherHeaderView()
        .previewLayout(.sizeThatFits)
        .padding()
}
