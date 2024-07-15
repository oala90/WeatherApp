//
//  ContentView.swift
//  WeatherApp
//
//  Created by Luis Orrantia on 7/15/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchCityWeatherView: View {
    
    @StateObject private var viewModel = DIContainer.shared.provideWeatherViewModel()

    
    var body: some View {
        VStack {
            SearchTextCity(onTextChange: { text in
                viewModel.searchCity = text
            }, onClickSearch: { text in
                viewModel.getWeatherByCity(city: text)
            }, text: viewModel.searchCity)
                    
                CityViewContainer(cityEntity: viewModel.cityWeather)
            }
    }
}

struct SearchTextCity: View {
    let onTextChange: (String) -> Void
    let onClickSearch: (String) -> Void
    @State private var text: String

    init(onTextChange: @escaping (String) -> Void, onClickSearch: @escaping (String) -> Void, text: String) {
        self.onTextChange = onTextChange
        self.onClickSearch = onClickSearch
        self._text = State(initialValue: text)
    }

    var body: some View {
        VStack {
            TextField("Enter a US city", text: $text, onCommit: {
                onClickSearch(text)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal, 50)
            .padding(.vertical, 50)
            .onChange(of: text, perform: { value in
                onTextChange(value)
            })
        }
    }
}

struct CityViewContainer: View {
    let cityEntity: CityEntity?

    var body: some View {
        if let cityEntity = cityEntity {
            CardView(cityEntity: cityEntity)
        } else {
            BoxView()
        }
    }
}

struct CardView: View {
    let cityEntity: CityEntity

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white)
                .shadow(radius: 10)

            HStack {
                VStack(alignment: .leading) {
                    Text(cityEntity.name ?? "Unknown")
                        .padding(5)
                    HStack {
                        Text("Weather: \(cityEntity.weather?.first?.description ?? "")")
                            .padding(5)
                            if let icon = cityEntity.weather?.first?.icon {
                                WebImage(url: URL(string: "https://openweathermap.org/img/wn/\(icon).png"))
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            }
                    }
                }
                VStack(alignment: .trailing) {
                    Text("Temperature \(cityEntity.main?.temp ?? 0) F")
                        .padding(5)
                    Text("Feels Like: \(cityEntity.main?.feels_like ?? 0) F")
                        .padding(5)
                }
            }
            .padding(.horizontal, 15)
        }
        .padding(.horizontal, 15)
    }
}

struct BoxView: View {
    var body: some View {
        Box(alignment: .center) {
            Text("City must be entered")
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Box<Content: View>: View {
    let content: Content
    var alignment: Alignment = .center

    init(alignment: Alignment = .center, @ViewBuilder content: () -> Content) {
        self.alignment = alignment
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: alignment) {
            content
        }
    }
}



#Preview {
    SearchCityWeatherView()
}
