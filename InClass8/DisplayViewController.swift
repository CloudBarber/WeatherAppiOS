//
//  DisplayViewController.swift
//  InClass8
//
//  Created by Evans, Jonathan on 3/22/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage


class DisplayViewController: UIViewController {
    
    var displayInfo: City?
    
    var cityName:String?
    var countryName: String?
    let apiKey = "f7c08f27c476c41adc53ba1f879c6325"
    
    
    @IBOutlet weak var CityDisplay: UILabel!
    
    
    @IBOutlet weak var CountryCodeDisplay: UILabel!
    
    
    @IBOutlet weak var TemperatureDisplay: UILabel!
    
    
    @IBOutlet weak var TempMaxDisplay: UILabel!
    
    
    @IBOutlet weak var TempMinDisplay: UILabel!
    
    
    @IBOutlet weak var DescriptionDisplay: UILabel!
    
    
    @IBOutlet weak var HumidityDisplay: UILabel!
    
    
    @IBOutlet weak var WindSpeedDisplay: UILabel!
    
    
    
    @IBOutlet weak var WindDegreeDisplay: UILabel!
    
    
    @IBOutlet weak var IconDisplay: UIImageView!
    
    
    @IBOutlet weak var CloudinessDisplay: UILabel!
    
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        print("In the Display weather for city View")
        
        //print("you are now in the Display values view controller:")
        DescriptionDisplay.text = displayInfo?.description

        
        let parameters: Parameters = ["q": "\(cityName!),\(countryName!)", "appid": apiKey, "units": "imperial"]
        
        
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather", method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                // data variable holds the main JSON data
                let data = JSON(response.result.value!)
                let weatherData = data["weather"].arrayValue
                let weatherJSON = weatherData[0]
                let temp = data["main"]["temp"].doubleValue
                let tempFormatted = String(format: "%.0f", temp)
                let tempMax = data["main"]["temp_max"].doubleValue
                let tempMaxFormatted = String(format: "%.2f", tempMax)
                let tempMin = data["main"]["temp_min"].doubleValue
                let tempMinFormatted = String(format: "%.2f", tempMin)
                
                //print(data)
                self.CityDisplay.text = "\(String(describing: self.cityName!)),"
                self.CountryCodeDisplay.text = self.countryName
                self.TemperatureDisplay.text = "\(tempFormatted) F"
                self.TempMaxDisplay.text = "\(tempMaxFormatted) F"
                self.TempMinDisplay.text = "\(tempMinFormatted) F"
                self.DescriptionDisplay.text = "\(weatherJSON["description"].stringValue)"
                self.HumidityDisplay.text = "\(data["main"]["humidity"].stringValue) %"
                self.WindSpeedDisplay.text = "\(data["wind"]["speed"].stringValue) miles/hr"
                self.WindDegreeDisplay.text = "\(data["wind"]["deg"].stringValue) degrees"
                self.CloudinessDisplay.text = "\(data["clouds"]["all"].stringValue) %"
                
                let icon = "http://openweathermap.org/img/w/\(weatherJSON["icon"].stringValue).png"
                
                self.IconDisplay.af_setImage(withURL: URL(string: icon)!)
                
                
                /*
                Alamofire.request("http://openweathermap.org/img/w/\(icon).png").responseImage { (response) in
                    if response.result.isSuccess{
                        //self.IconDisplay.image = response.result.value
                        print("Image Responded")
                        self.IconDisplay.image = response.result.value
                        
                    }}
 */
            }
            
            else{
                print("failure")
            }
            
            
        }
        
       
        
        /*
         AF.request("http://api.openweathermap.org/data/2.5/weather?q=\(city),\(state)&appid=\(apiKey)").responseJSON {
         
         //gets the response
         (response) in
         
         
         if response.result.isSuccess{
         print("Success!!")
         
         // data variable holds the main JSON data
         let data = JSON(response.result.value!)
         
         
         // weathers variable holds an array of JSON data (containing 1 element)
         var weathers = data["weather"].arrayValue
         
         // weatherData variable holds the JSON data from the weathers array
         let weatherData = JSON(weathers[0])
         // print(weatherData)                  //debugging prints weathers array element
         //  let cloudy = weatherData["main"]    //sets cloudy information
         //  print(cloudy)                       //debugging prints cloudy
         print(data)
         self.city = data["name"].stringValue
         
         self.cityInfo = City(city: data["name"].stringValue,countryCode: data["sys"]["country"].stringValue,temperature: data["main"]["temp"].floatValue,tempMax: data["main"]["temp_max"].floatValue,tempMin: data["main"]["temp_min"].floatValue,description: weatherData["description"].stringValue,humidity: data["main"]["humidity"].intValue,windSpeed: data["wind"]["speed"].doubleValue,windDegree: data["wind"]["degree"].floatValue,cloudiness: data["clouds"]["all"].intValue)
         
         
         }
         else{
         print("Failure!!")
         }
         }
         */
    

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
     
        if segue.identifier == "toForecast"{
            
            let destinationVC = segue.destination as! ForecastViewController
            destinationVC.cityName = cityName
            destinationVC.countryCode = countryName
            
        }
        
    }
}
