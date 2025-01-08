//
//  currentInfotile.swift
//  wetherappclouds
//
//  Created by hafeez Sheik on 08/01/25.
//

import SwiftUI


struct currentInfotile : View{
    var currentTime: String
    var currentDate: String
    var city: String
    var icon : String
    
    var body: some View {  VStack(alignment: .leading, spacing: 5) {
        Text(currentTime)
            .font(.title3)
            .foregroundColor(.gray)
        
        Text(currentDate)
            .font(.title2)
            .foregroundColor(.gray)
        
        Text(city)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.primary)
        
        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        } placeholder: {
            ProgressView() // A loading spinner
        }
        .frame(width: 50, height: 50)
    }
    .padding()
    .background(LinearGradient(
        gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.3)]),
        startPoint: .top,
        endPoint: .bottom
    ))
    .cornerRadius(15)
    .shadow(radius: 5)
    }
}
