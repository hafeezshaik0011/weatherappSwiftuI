//
//  SearchBarView.swift
//  wetherappclouds
//
//  Created by hafeez Sheik on 08/01/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var cityName: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Enter city name", text: $cityName)
                .padding(.horizontal)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(height: 40)
        }
        .padding(10)
        .frame(width: UIScreen.main.bounds.width - 50,height: 40)
        .background(RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .shadow(radius: 5))
        .padding(.horizontal)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var cityName = "New York"
    
    static var previews: some View {
        SearchBarView(cityName: $cityName)
    }
}
