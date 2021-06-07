//
//  WeatherViewController.swift
//  DefinitelyNotAlarmy
//
//  Created by Vitor Jundi Moriya on 26/05/21.
//

import Foundation
import UIKit
import SwiftUI


class FeedViewController: UIViewController {
    let feedView = FeedView()
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemGray4
        
       
        view.addSubview(feedView)
        feedView.translatesAutoresizingMaskIntoConstraints = false
    }
}

class FeedView: UIView {
    
    let weatherView = WeatherView()
    let horoscopeView = HoroscopeView()
    let newsView = NewsView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(weatherView)
        addSubview(horoscopeView)
        let adView = UIImageView(image: UIImage(named: "ad"))
        addSubview(adView)
        addSubview(newsView)
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        horoscopeView.translatesAutoresizingMaskIntoConstraints = false
        adView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: -70),
            weatherView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: -10),
            weatherView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 400),
            weatherView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: 420),
            horoscopeView.topAnchor.constraint(equalTo: weatherView.bottomAnchor, constant: -140),
            horoscopeView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: -10),
            adView.topAnchor.constraint(equalTo: horoscopeView.bottomAnchor, constant: 140),
            adView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 45)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }

    
}

class WeatherView: UIView{
    var temperature:Float = 0
    
    let weatherIcon = UIImageView(image: UIImage(named: "SunnyCloud"))
    let maxTemperatureLabel = UILabel()
    let temperatureLabel = UILabel()
    let minTemperatureLabel = UILabel()
    let localLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 390, height: 260))
        
        
        backgroundColor = .white
        let settingsButtonImage = UIImage(systemName: "gearshape.fill")
        let settingsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        settingsButton.setBackgroundImage(settingsButtonImage, for: UIControl.State.normal)
        addSubview(settingsButton)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        let todayLabel = UILabel()
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.font = UIFont(name: "Avenir-Bold", size: 11.0)
        todayLabel.text = "TODAY'S PANEL"
        todayLabel.textColor = .systemGray
        todayLabel.numberOfLines = 0
        addSubview(todayLabel)
        
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        dateLabel.text = "Thursday, 25 May"
        dateLabel.numberOfLines  = 0
        addSubview(dateLabel)
    
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(weatherIcon)
    
        
        localLabel.translatesAutoresizingMaskIntoConstraints = false
        localLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        localLabel.text = "Goiânia, Partly sunny"
        localLabel.numberOfLines  = 0
        addSubview(localLabel)
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        temperatureLabel.text = "0°"
        temperatureLabel.numberOfLines  = 0
        addSubview(temperatureLabel)
        
        
        let celsiusLabel = UILabel()
        celsiusLabel.translatesAutoresizingMaskIntoConstraints = false
        celsiusLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        celsiusLabel.text = "c"
        celsiusLabel.numberOfLines  = 0
        addSubview(celsiusLabel)
        
        let maxTemperatureIcon = UIImageView(image: UIImage(systemName: "arrow.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10.0))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal))
        
        addSubview(maxTemperatureIcon)
        maxTemperatureIcon.translatesAutoresizingMaskIntoConstraints = false
        
        maxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTemperatureLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        maxTemperatureLabel.text = "0°"
        maxTemperatureLabel.textColor = .systemGray
        maxTemperatureLabel.numberOfLines  = 0
        addSubview(maxTemperatureLabel)
        
        let minTemperatureIcon = UIImageView(image: UIImage(systemName: "arrow.down", withConfiguration: UIImage.SymbolConfiguration(pointSize: 10.0))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal))
        
        addSubview(minTemperatureIcon)
        minTemperatureIcon.translatesAutoresizingMaskIntoConstraints = false
        
        
        minTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        minTemperatureLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        minTemperatureLabel.text = "0°"
        minTemperatureLabel.textColor = .systemGray
        minTemperatureLabel.numberOfLines  = 0
        addSubview(minTemperatureLabel)
        
        let previousDayCompareLabel = UILabel()
        previousDayCompareLabel.translatesAutoresizingMaskIntoConstraints = false
        previousDayCompareLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        previousDayCompareLabel.text = "1° cooler than yesterday"
        previousDayCompareLabel.numberOfLines  = 0
        previousDayCompareLabel.textColor = .systemGray
        addSubview(previousDayCompareLabel)
        
        let sponsorIcon = UIImageView(image: UIImage(named: "AccuWeatherLogo"))
        sponsorIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sponsorIcon)
        
        let weekendForecastLabel = UILabel()
        weekendForecastLabel.translatesAutoresizingMaskIntoConstraints = false
        weekendForecastLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        weekendForecastLabel.text = "Mostly cloudy this weekend"
        weekendForecastLabel.numberOfLines  = 0
        addSubview(weekendForecastLabel)
        
       
        
        let request = WeatherRequest(placeName: "Goiania")
        request.getTemperature { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let temp):
                DispatchQueue.main.async {
                    self.temperatureLabel.text = String(format: "%.1f°", temp.main.temp)
                    self.minTemperatureLabel.text = String(format: "%.0f°", temp.main.temp_min)
                    self.maxTemperatureLabel.text = String(format: "%.0f°", temp.main.temp_max)
                    self.localLabel.text = "\(temp.name), \(temp.weather.first?.description ?? "ERROR")"
                    self.downloadImage(from: URL(string: "https://openweathermap.org/img/wn/\(temp.weather.first?.icon ?? "09d")@2x.png")!)
                }
            }
        }
        
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 18),
            settingsButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -15),
            todayLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 40),
            todayLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 14),
            dateLabel.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 2),
            dateLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 14),
            weatherIcon.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 50),
            weatherIcon.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 5),
            localLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 36),
            localLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 10),
            temperatureLabel.topAnchor.constraint(equalTo: localLabel.bottomAnchor, constant: 2),
            temperatureLabel.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 10),
            celsiusLabel.topAnchor.constraint(equalTo: localLabel.bottomAnchor, constant: 0),
            celsiusLabel.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 0),
            maxTemperatureIcon.topAnchor.constraint(equalTo: localLabel.bottomAnchor, constant: 9),
                maxTemperatureIcon.leadingAnchor.constraint(equalTo: celsiusLabel.trailingAnchor, constant: 0),
            maxTemperatureLabel.topAnchor.constraint(equalTo: localLabel.bottomAnchor, constant: 7),
            maxTemperatureLabel.leadingAnchor.constraint(equalTo: maxTemperatureIcon.trailingAnchor, constant: 0),
            minTemperatureIcon.topAnchor.constraint(equalTo: localLabel.bottomAnchor, constant: 9),
                minTemperatureIcon.leadingAnchor.constraint(equalTo: maxTemperatureLabel.trailingAnchor, constant: 6),
            minTemperatureLabel.topAnchor.constraint(equalTo: localLabel.bottomAnchor, constant: 7),
            minTemperatureLabel.leadingAnchor.constraint(equalTo: minTemperatureIcon.trailingAnchor, constant: 0),
            previousDayCompareLabel.topAnchor.constraint(equalTo: maxTemperatureLabel.bottomAnchor, constant: 0),
            previousDayCompareLabel.leadingAnchor.constraint(equalTo: celsiusLabel
                                                                .trailingAnchor, constant: 2),
            sponsorIcon.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 0),
            sponsorIcon.leadingAnchor.constraint(equalTo: weatherIcon.trailingAnchor, constant: 10),
            weekendForecastLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 23),
            weekendForecastLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 33)
            
        ])
    }
    func downloadImage(from url:URL) {
        let dataTask = URLSession.shared.dataTask(with: url){ data, _, _ in
            guard let data = data else { return }
            
            DispatchQueue.main.async() {
                
                self.weatherIcon.image = UIImage(data: data)
                self.weatherIcon.contentMode = .scaleAspectFill
                self.weatherIcon.setNeedsDisplay()
            }
            
        }
        dataTask.resume()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        
    }
}

class HoroscopeView: UIView {

    override init(frame: CGRect) {
        
        
        super.init(frame: CGRect(x: 0, y: 0, width: 390, height: 140))
        self.backgroundColor = .white
        
        let horoscopeLabel = UILabel()
        horoscopeLabel.translatesAutoresizingMaskIntoConstraints = false
        horoscopeLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        horoscopeLabel.text = "Horoscope"
        
        let horoscopeIcon = UIImageView(image: UIImage(named: "Aquarius"))
        horoscopeIcon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horoscopeIcon)
        
        let horoscopeBallon = UIImageView(image: UIImage(named: "horoscopeMessage"))
        horoscopeBallon.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horoscopeBallon)
        
        let todayLabel = UILabel()
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        todayLabel.text = "Code while they sleep! \nBe yourself!"
        todayLabel.numberOfLines = 0
        addSubview(todayLabel)
        
        
        addSubview(horoscopeLabel)
        
        NSLayoutConstraint.activate([
            horoscopeLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 16),
            horoscopeLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            horoscopeIcon.topAnchor.constraint(equalTo: horoscopeLabel.bottomAnchor, constant: 17),
            horoscopeIcon.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 15),
            horoscopeBallon.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 58),
            horoscopeBallon.leadingAnchor.constraint(equalTo: horoscopeIcon.trailingAnchor, constant: 13),
            todayLabel.leadingAnchor.constraint(equalTo: horoscopeBallon.leadingAnchor, constant: 25),
            todayLabel.topAnchor.constraint(equalTo: horoscopeBallon.topAnchor, constant: 12)
        ])
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class NewsView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}

struct WeatherInfo: Decodable{
    var weather: [WeatherDescription]
    var name: String
    var main: WeatherMain
}

struct WeatherDescription: Decodable{
    var description: String
    var icon: String
}

struct WeatherMain: Decodable{
    var temp: Float
    var feels_like: Float
    var temp_min: Float
    var temp_max: Float
}

enum weatherError: Error{
    case noDataAvaible
    case cannotProcessData
}

struct WeatherRequest{
    let resourceURL: URL
    let API_KEY = "742bbdeb5e11a7df28f5c777cb77ff3a"
    
    init(placeName:String) {
        
        let resourceString = "https://api.openweathermap.org/data/2.5/weather?q=Goiania&units=metric&appid=742bbdeb5e11a7df28f5c777cb77ff3a"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func getTemperature(completion: @escaping(Result<WeatherInfo, weatherError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL){ data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvaible))
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(WeatherInfo.self, from: jsonData)
                print(weatherResponse)
                completion(.success(weatherResponse))
            } catch{
                completion(.failure(.cannotProcessData))
            }
            
        }
        dataTask.resume()
    }
}



