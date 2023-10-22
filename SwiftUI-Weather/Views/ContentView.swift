//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Willian Peres on 21/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    let weatherList: [WeatherModel] = [
        WeatherModel(dayOfWeek: "TER", imageName: "cloud.sun.fill", temperature: 21),
        WeatherModel(dayOfWeek: "QUA", imageName: "cloud.bolt.rain.fill", temperature: 24),
        WeatherModel(dayOfWeek: "QUI", imageName: "cloud.bolt.rain.fill", temperature: 26),
        WeatherModel(dayOfWeek: "SEX", imageName: "cloud.sun.fill", temperature: 21),
        WeatherModel(dayOfWeek: "SÁB", imageName: "cloud.fill", temperature: 18),
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)

            VStack {
                CityTextView(cityName: "Palhoça, SC")

                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 21)

                HStack(spacing: 20) {
                    ForEach(weatherList.indices, id: \.self) { index in
                        WeatherDayView(data: weatherList[index])
                    }
                }

                Spacer()

                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Mudar hora do dia", textColor: .blue, backgroundColor: .white)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var data: WeatherModel

    var body: some View {
        VStack {
            Text(data.dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)

            Image(systemName: data.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

            Text("\(data.temperature)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(temperature)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
