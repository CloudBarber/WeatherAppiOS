//
//  Country.swift
//  InClass8
//
//  Created by Evans, Jonathan on 3/22/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import Foundation
import SwiftyJSON

let url = "http://api.openweathermap.org/data/2.5/weather"
let apiKey = "f7c08f27c476c41adc53ba1f879c6325"



class City{
    var city: String?
    var countryCode: String?
    var temperature: Float?
    var tempMax: Float?
    var tempMin: Float?
    var description: String?
    var humidity: Int?
    var windSpeed: Double?
    var windDegree: Float?
    var cloudiness: Int?
    
    
    init(city: String, countryCode: String, temperature: Float, tempMax: Float, tempMin: Float, description: String, humidity: Int, windSpeed: Double, windDegree: Float, cloudiness: Int){
        
        
        self.city = city
        self.countryCode = countryCode
        self.temperature = temperature
        self.tempMax = tempMax
        self.tempMin = tempMin
        self.description = description
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windDegree = windDegree
        self.cloudiness = cloudiness
        
    }
}
























/*
class City{
    
    var city: String?
    var sys: Sys?
    var weather: Weather?
    var tempAndHumidity: Main?
    var wind: Wind?
    
    
    init(json: JSON){
       
        self.city = json["name"].stringValue
        self.sys = Sys(json: json["sys"])
        self.weather = Weather(json: json["weather"])
        self.tempAndHumidity = Main(json: json["main"])
        self.wind = Wind(json: json["wind"])
    }
}
    
    class Sys{
        var countryCode: String?
        
        init(json: JSON){
            self.countryCode = json["country"].stringValue
    }
}
    
    class Weather{
        var description: String?
        var cloudiness: String?
        
        init(json: JSON){
            self.description = json["weather"]["main"].stringValue
            self.cloudiness = json["weather"]["description"].stringValue
        }
    }
    
    class Main{
        var humidity: Int?
        var temp: Int?
        var tempMax: Int?
        var tempMin: Int?
        
        init(json: JSON){
            self.humidity = json["humidity"].intValue
            self.temp = json["temp"].intValue
            self.tempMax = json["temp_max"].intValue
            self.tempMin = json["temp_min"].intValue
        }
    }
    
    
    class Wind{
        var windDegree: Int?
        var windSpeed: Float?
        
        init(json: JSON){
            self.windDegree = json["deg"].intValue
            self.windSpeed = json["speed"].floatValue
    }
}
*/

    

