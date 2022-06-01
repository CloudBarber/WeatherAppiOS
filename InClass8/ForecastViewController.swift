//
//  ForecastViewController.swift
//  InClass8
//
//  Created by Evans, Jonathan on 3/27/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ForecastViewController: UIViewController {
    
    
    let apiKey = "f7c08f27c476c41adc53ba1f879c6325"
    var cityName:String?
    var countryCode:String?
    var DateTime: String?
    var forecastArray = [JSON]()
    var counter: Int?
    var weatherData = [JSON]()
    
    
    @IBOutlet weak var CountryCodeLabel: UILabel!
    
    
    @IBOutlet weak var CityNameLabel: UILabel!
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
 
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomCell")

        // Do any additional setup after loading the view.
        
        self.CityNameLabel.text = "\(String(describing: cityName!)), "
        self.CountryCodeLabel.text = countryCode
        let parameters: Parameters = ["q": "\(cityName!),\(countryCode!)", "appid": apiKey, "units": "imperial"]
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/forecast", method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                
                print("success")
                let jsonData = JSON(response.result.value!)
                //print(jsonData)
                //self.data =
                
                self.forecastArray = jsonData["list"].arrayValue
                //print(self.forecastArray)
                self.DateTime = self.forecastArray[0]["dt_txt"].stringValue
                self.counter = self.forecastArray.count
                print("the counter is: \(self.counter!)")
                print(self.forecastArray[0]["weather"])
                print("The Icon in weather section of first forecast array \(self.forecastArray[0]["weather"][0]["icon"])")
                
               
                //let oneIcon = self.forecastArray[0].["weather"]["icon"].stringValue
                self.tableView.reloadData()
            }
            
            else{
                print("error")
            }
        }
        
      
        
        
    }
    

}

extension ForecastViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print ("Forecast Array in numberOfRowsInSection Has: \(forecastArray.count) members")
        
        return forecastArray.count
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        
        print("Forecast Array in cellForRowAt Has: \(forecastArray.count) members")
        
        if forecastArray.count > 0{
        
            //String(format: "Angle: %.2f", angle)
            let temperature = forecastArray[indexPath.row]["main"]["temp"].doubleValue
            let temperatureFormatted = String(format: "%.0f", temperature)
            let tempMax = forecastArray[indexPath.row]["main"]["temp_max"].doubleValue
            let tempMaxFormatted = String(format: "%.1f", tempMax)
            let tempMin = forecastArray[indexPath.row]["main"]["temp_min"].doubleValue
            let tempMinFormatted = String(format: "%.1f", tempMin)
            
        cell.dateTimeLabel.text = "Date and Time: \(forecastArray[indexPath.row]["dt_txt"].stringValue)"
        cell.TemperatureLabel.text = "Temp: \(temperatureFormatted) F"
        cell.MaxTempLabel.text = "Max: \(tempMaxFormatted) F"
        cell.MinTempLabel.text = "Min: \(tempMinFormatted) F"
        cell.HumidityLabel.text = "Humiditiy: \(forecastArray[indexPath.row]["main"]["humidity"].stringValue)%"
        var forecastWeather = forecastArray[indexPath.row]["weather"]
        cell.DescriptionLabel.text = forecastWeather[0]["description"].stringValue
        var icon = "http://openweathermap.org/img/w/\(forecastWeather[0]["icon"].stringValue).png"
         
            //http://openweathermap.org/img/w/10d.png
            
            print("The icon is: \(icon)")
            cell.ForecastImageOutlet.af_setImage(withURL: URL(string: icon)!)
        }
        else{}
     
        
        return cell
    }
    
    
}

extension ForecastViewController: UITableViewDelegate
{
    
}
